//
//  AutoVimew.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct IntegerAtomView: View {
    @Binding var valid: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("原子操作 integer")
                .padding(.top, 24)
            MinButton(title: "更新 integer = 5(expand pointer/触发)", background: Color.clear) {
                EditCase.atomUpdate()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "integer += 1", background: Color.clear) {
                EditCase.atomAdd()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "integer -= 1", background: Color.clear) {
                EditCase.atomMinus()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
        }
    }
}

struct ArrayAtomView: View {
    @Binding var valid: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("数组原子操作 arrayInt = [1, 2, 3]")
                .padding(.top, 24)
            MinButton(title: "删除 1", background: Color.clear) {
                EditCase.atomArrayMinus()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "增加 [3, 6], (不剔除重复元素)", background: Color.clear) {
                EditCase.atomArrayAppend()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "增加 [3, 5], (剔除重复元素)", background: Color.clear) {
                EditCase.atomArrayUAppend()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "更新  [1, 3]", background: Color.clear) {
                EditCase.atomArrayUpdate()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "删除最后一个元素", background: Color.clear) {
                EditCase.atomArrayPop()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
            
            MinButton(title: "删除第一个元素", background: Color.clear) {
                EditCase.atomArrayShift()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
        }
    }
}

struct ObjectAtomView: View {
    @Binding var valid: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("原子操作 Object")
                .padding(.top, 24)
            MinButton(title: "object.key1 incrementBy 3", background: Color.clear) {
                EditCase.atomObjectincrementBy()
            }
            .background(valid ? Color.green : Color.gray)
            .disabled(!valid)
        }
    }
}

struct AtomView: View {
    @Binding var valid: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            IntegerAtomView(valid: $valid)
            ArrayAtomView(valid: $valid)
            ObjectAtomView(valid: $valid)
        }
    }
}
