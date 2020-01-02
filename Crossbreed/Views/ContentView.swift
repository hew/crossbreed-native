//
//  ContentView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

public class Todo: Codable, Identifiable {
    
    public let userID: Int
    public let id: Int
    public var title: String
    public var completed: Bool
    public var pinned: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
        case pinned = "pinned"
    }
    
    public init(userID: Int, id: Int, title: String, completed: Bool, pinned: Bool) {
        self.userID = userID
        self.id = id
        self.title = title
        self.completed = completed
        self.pinned = pinned
    }
    
    public init() {
        self.userID = 0
        self.id = 0
        self.title = ""
        self.completed = false
        self.pinned = false
    }
}

public typealias Todos = [Todo]

public class TodoCellViewModel {
    
    private var todo: Todo
    
    public init(todo: Todo) {
        self.todo = todo
    }
    
    public func isPinned() -> Bool {
        return self.todo.pinned ?? false
    }
    
    public func isComleted() -> Bool {
        return self.todo.completed
    }
    
    public func getTitle() -> String {
        return self.todo.title
    }
    
    public func getId() -> Int {
        return self.todo.id
    }
}

public class TodoListViewModel: ObservableObject {
    
    @Published var todos: Todos = [Todo]()
    
    func shuffle() {
        self.todos = self.todos.shuffled()
    }
    
    func sort() {
        self.todos = self.todos.sorted(by: { ($0.pinned ?? false) && (!($1.pinned ?? false)) })
        self.objectWillChange.send()
    }
    
    func markDone(id: Int) {
        self.todos.first(where: { $0.id == id })?.completed.toggle()
        self.objectWillChange.send()
    }
    
    func pin(id: Int) {
        let item = self.todos.first(where: { $0.id == id })
        if let _ = item?.pinned {
            item?.pinned?.toggle()
        } else {
            item?.pinned = true
        }
        self.sort()
    }
    
    func load() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let todos = try JSONDecoder().decode(Todos.self, from: data)
                DispatchQueue.main.async {
                    self.todos = todos
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
}

struct TodoCell : View {
    var todoCellViewModel: TodoCellViewModel
    var markDoneAction: ((_ id: Int) -> Void)
    var pinAction: ((_ id: Int) -> Void)
    
    var body: some View {
        HStack {
            // NOT USING BUTTONS BUT IMAGE + TAP ACTION
            // BUG W/ Buttons in List
            
            Image(systemName: (self.todoCellViewModel.isComleted() ? "checkmark.square" : "square")).onTapGesture {
                self.markDoneAction(self.todoCellViewModel.getId())
            }
            
            Text(self.todoCellViewModel.getTitle())
            Spacer()
            
            Image(systemName: (self.todoCellViewModel.isPinned() ? "pin.fill" : "pin")).onTapGesture {
                self.pinAction(self.todoCellViewModel.getId())
            }
            //.padding(.trailing, 10)
            //Image(systemName: "ellipsis")
        }
        .padding()
    }
}

struct TodoList : View {
    var todos: Todos
    var markDoneAction: ((_ id: Int) -> Void)
    var pinAction: ((_ id: Int) -> Void)
    
    var body: some View {
        List(self.todos) { todo in
            TodoCell(todoCellViewModel: TodoCellViewModel(todo: todo), markDoneAction: { (id) in
                self.markDoneAction(id)
            }) { (id) in
                self.pinAction(id)
            }
        }
    }
}

struct ContentView : View {
    @ObservedObject var viewModel: TodoListViewModel = TodoListViewModel()
    
    var body: some View {
        FetchView()
    }
}

#if DEBUG
let viewModel = TodoListViewModel()

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(viewModel)
    }
}
#endif
