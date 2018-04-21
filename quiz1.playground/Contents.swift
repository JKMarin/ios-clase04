//: Playground - noun: a place where people can play

import UIKit
let bitCoinPrice:Double = 10
func compra(_ dolares:Double)-> Double? {
    if dolares >= bitCoinPrice {
        let bitcoins = Double(Int(dolares / bitCoinPrice))
        print(cambio(dolares))
        return bitcoins
    }else{
        return nil
    }
}
func cambio(_ dolares:Double)-> Double{
     return dolares.truncatingRemainder(dividingBy: bitCoinPrice)
}
let cantidad = compra(25)
print(cantidad)
print (cambio(25))
compra(5)


