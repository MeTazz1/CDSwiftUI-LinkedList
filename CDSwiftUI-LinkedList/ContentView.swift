//
//  ContentView.swift
//  SwiftUI-LinkedList
//
//  Created by Chris on 3/23/20.
//  Copyright © 2020 NSChris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // The displayed Element
    @State private var displayedNode: Node<String>?
    @State private var stepperValue: Int = 0
    @State private var removeStepperValue: Int = 0
    
    private var linkedList: LinkedList<String>
    
    init() {
        // Creating List for Test Purposes
        linkedList = LinkedList()
        linkedList.append(value: self.generateRandomString())
        linkedList.append(value: self.generateRandomString())
        linkedList.append(value: self.generateRandomString())
        linkedList.append(value: self.generateRandomString())
        linkedList.append(value: self.generateRandomString())
        
        // MARK: - Swift 5.2 <3
        print("Current size: \(linkedList())") // actually calls callAsFunction()
    }
    
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            VStack {
                Text("Actions:")
                    .font(.title)
                    .fontWeight(.medium)
                
                HStack(alignment: .top) {
                    VStack() {
                        // Insert
                        Button(action: {
                            self.linkedList.insert(value: self.generateRandomString())
                            self.displayedNode = self.linkedList.head
                        }, label: {
                            Text("Insert node")
                                .foregroundColor(Color.green)
                                .multilineTextAlignment(.leading)
                        })
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack() {
                        // Append
                        Button(action: {
                            self.linkedList.append(value: self.generateRandomString())
                            self.displayedNode = self.linkedList.tail
                            
                        }, label: {
                            Text("Append node")
                                .foregroundColor(Color.green)
                        })
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack() {
                        // Get Node at Index
                        Stepper(onIncrement: {
                            self.stepperValue += 1
                            self.displayedNode = self.linkedList.nodeAtIndex(self.stepperValue)
                        }, onDecrement: {
                            self.stepperValue -= 1
                            self.displayedNode = self.linkedList.nodeAtIndex(self.stepperValue)
                        }, label: { EmptyView() })
                    
                        Button(action: {
                        }, label: {
                            Text("Node at index \(stepperValue)")
                                .foregroundColor(Color.green)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(2)
                        })
                    }
                    .padding()
                }
                
                HStack(alignment: .top) {
                    VStack() {
                        // Clear
                        Button(action: {
                            self.linkedList.clear()
                            self.displayedNode = nil
                        }, label: {
                            Text("Clear List")
                                .foregroundColor(Color.orange)
                        })
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack() {
                        // Clear
                        Button(action: {
                            if let tmpNode = self.displayedNode {
                                if self.displayedNode?.previous != nil {
                                    self.displayedNode = self.displayedNode?.previous
                                } else if (self.displayedNode?.next != nil) {
                                    self.displayedNode = self.displayedNode?.next
                                }
                                else {
                                    self.displayedNode = nil
                                }
                                self.linkedList.remove(node: tmpNode)
                            }
                        }, label: {
                            Text("Remove current")
                                .foregroundColor(Color.orange)
                                .lineLimit(0)
                        })
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        // Remove Node at Index
                        Stepper(value: $removeStepperValue, in: 0 ... (self.linkedList.size != 0 ? self.linkedList.size - 1 : 0), label: { EmptyView() })
                        
                        Button(action: {
                            if self.displayedNode?.previous != nil {
                                self.displayedNode = self.displayedNode?.previous
                            } else if (self.displayedNode?.next != nil) {
                                self.displayedNode = self.displayedNode?.next
                            }
                            else {
                                self.displayedNode = nil
                            }
                            self.linkedList.removeNodeAtIndex(self.removeStepperValue)
                            
                        }, label: {
                            Text("Remove Node at index \(removeStepperValue)")
                                .foregroundColor(Color.orange)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(2)
                            
                        })
                    }
                    .padding()
                }
            }
            
            Spacer()
            
            HStack(alignment: .center) {
                // Navigate to previous
                Button(action: {
                    if (self.displayedNode != nil && self.displayedNode!.previous != nil) {
                        self.displayedNode = self.displayedNode!.previous
                    }
                }, label: {
                    Image(systemName: "chevron.left.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                })
                
                Spacer()
                
                Text(displayedNode != nil ? displayedNode!.getValue() : "No node to display")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                Spacer()
                
                // Navigate to next
                Button(action: {
                    if (self.displayedNode != nil && self.displayedNode!.next != nil) {
                        self.displayedNode = self.displayedNode!.next
                    }
                }, label: {
                    Image(systemName: "chevron.right.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                })
            }
            Spacer()
        }
        .onAppear() {
            // Set the @State property here since init() is called prior to the
            // class properties initalizers
            self.displayedNode = self.linkedList.head
        }
    }
    
    private func generateRandomString() -> String {
        return String((0..<8 ).map{ _ in "qwertyuinm123456789".randomElement()! })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        return ContentView()
    }
}
