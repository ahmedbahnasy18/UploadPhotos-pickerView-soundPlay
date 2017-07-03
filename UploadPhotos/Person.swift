//
//  Person.swift
//  UploadPhotos
//
//  Created by ahmed on 7/1/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import Foundation
                                     //Perfect Model
class Person {
    private var _name: String!
    private var _age: Int!
    
    var name: String {
        get {
            return _name
        } set {
            _name = newValue
        }
    }
    var age: Int {
        get {
            return _age
        } set {
            _age = newValue
        }
    }
    
    init(name: String, age: Int) {
        self._name = name
        self._age = age
    }
}
