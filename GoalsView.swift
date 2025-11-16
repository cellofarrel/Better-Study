import SwiftUI

struct GoalsView: View {
  @AppStorage("goals") private var storedGoalsData: Data = Data()
  @State private var storedGoals: [Goal] = []

  @State private var isEditingTitle = false
  @State private var newGoalTitle = ""
  @State private var editingGoal: Goal?
  
  var body: some View {
    NavigationView {
      List {
        ForEach($storedGoals, id: \.id) { $goal in
          GoalRow(goal: $goal, isEditingTitle: $isEditingTitle, newGoalTitle: $newGoalTitle, editingGoal: $editingGoal, saveGoals: saveGoals)
        }
        .onDelete(perform: deleteGoal)
      }
      .onAppear {
        storedGoals = loadGoals()
      }
      .navigationTitle("My Goals")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          EditButton()
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            addNewGoal()
          }) {
            Image(systemName: "plus")
          }
        }
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }

  init() {
  }

  func deleteGoal(at offsets: IndexSet) {
    storedGoals.remove(atOffsets: offsets)
    saveGoals()
  }

  func addNewGoal() {
    storedGoals.append(Goal(title: "New Goal", status: .pending))
    saveGoals()
  }

  func loadGoals() -> [Goal] {
    guard let goals = try? JSONDecoder().decode([Goal].self, from: storedGoalsData) else {
      return []
    }
    return goals
  }

  func saveGoals() {
    guard let encodedData = try? JSONEncoder().encode(storedGoals) else {
      return
    }
    storedGoalsData = encodedData
  }
}


struct GoalRow: View {
    @Binding var goal: Goal
    @Binding var isEditingTitle: Bool
    @Binding var newGoalTitle: String
    @Binding var editingGoal: Goal?
    var saveGoals: () -> Void
    
    var body: some View {
        HStack {
            if isEditingTitle && goal.id == editingGoal?.id {
                TextField("Enter goal name", text: $newGoalTitle)
                    .onSubmit {
                        if !newGoalTitle.isEmpty {
                            editGoalTitle()
                            newGoalTitle = ""
                        }
                        isEditingTitle = false
                    }
            } else {
                Text(goal.title)
                    .onTapGesture {
                        startEditingTitle()
                    }
            }
            Spacer()
            Text(goal.status.rawValue.capitalized)
                .onTapGesture {
                    cycleGoalStatus()
                }
        }
    }

    func startEditingTitle() {
        editingGoal = goal
        newGoalTitle = goal.title
        isEditingTitle = true
    }

    func editGoalTitle() {
        goal.title = newGoalTitle
        saveGoals()
    }

    func cycleGoalStatus() {
        switch goal.status {
        case .pending: goal.status = .inProgress
        case .inProgress: goal.status = .completed
        case .completed: goal.status = .pending
        }
        saveGoals()
    }
}

struct Goal: Identifiable, Codable {
    var id = UUID()
    var title: String
    var status: GoalStatus
}

enum GoalStatus: String, CaseIterable, Codable {
    case pending, inProgress, completed
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
