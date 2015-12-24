//
//  ControlPanel.swift
//  ExiteCross
//
//  Created by Jorge Castro on 11/29/15.
//  Copyright © 2015 Xilo. All rights reserved.
//

import SpriteKit

class ControlPanel{
    
    //Definicion de las variables que puede tener el corredor
    private var buttonUpImage : SKSpriteNode
    private var buttonDownImage : SKSpriteNode
    private var buttonLeftImage : SKSpriteNode
    private var buttonRightImage : SKSpriteNode
    private var buttonNitroImage : SKSpriteNode
    private var buttonAccelerateImage : SKSpriteNode
    private var pressedButton : String
    
    //Inicializar el objeto
    init (buttonUpImage: SKSpriteNode, buttonDownImage: SKSpriteNode, buttonLeftImage: SKSpriteNode, buttonRightImage: SKSpriteNode,
        buttonNitroImage: SKSpriteNode ,  buttonAccelerateImage: SKSpriteNode, pressedButton: String){
        self.buttonUpImage = buttonUpImage
        self.buttonDownImage = buttonDownImage
        self.buttonLeftImage = buttonLeftImage
        self.buttonRightImage = buttonRightImage
        self.buttonNitroImage = buttonNitroImage
        self.buttonAccelerateImage = buttonAccelerateImage
        self.pressedButton = pressedButton
    }
    
    //Establece los metodos de acceso a los objetos SKSpriteNode
    func setButtonUpImage (node: SKSpriteNode){
        self.buttonUpImage = node
    }
    
    func getButtonUpImage ()->SKSpriteNode{
        return self.buttonUpImage
    }
    
    func setButtonDownImage (node: SKSpriteNode){
        self.buttonDownImage = node
    }
    
    func getButtonDownImage ()->SKSpriteNode{
        return self.buttonDownImage
    }
    
    func setButtonLeftImage (node: SKSpriteNode){
        self.buttonLeftImage = node
    }
    
    func getButtonLeftImage ()->SKSpriteNode{
        return self.buttonLeftImage
    }
    
    func setButtonRightImage (node: SKSpriteNode){
        self.buttonRightImage = node
    }
    
    func getButtonRightImage ()->SKSpriteNode{
        return self.buttonRightImage
    }
    
    func setButtonNitroImage (node: SKSpriteNode){
        self.buttonNitroImage = node
    }
    
    func getButtonNitroImage ()->SKSpriteNode{
        return self.buttonNitroImage
    }
    
    func setButtoAccelerateImage (node: SKSpriteNode){
        self.buttonAccelerateImage = node
    }
    
    func getButtonAccelerateImage ()->SKSpriteNode{
        return self.buttonAccelerateImage
    }
    
    //Establecer la posicion del boton de arriba
    func setPositionButtonUp (point: CGPoint){
        self.buttonUpImage.position = point
    }
    
    func getPositionButtonUp () -> CGPoint{
        return self.buttonUpImage.position
    }
    
    //Establecer la posicion del boton de abajo
    func setPositionButtonDown (point: CGPoint){
        self.buttonDownImage.position = point
    }
    
    func getPositionButtonDown () -> CGPoint{
        return self.buttonDownImage.position
    }
    
    //Establecer la posicion del boton de izquierda
    func setPositionButtonLeft (point: CGPoint){
        self.buttonLeftImage.position = point
    }
    
    func getPositionButtonLeft ()-> CGPoint{
        return self.buttonLeftImage.position
    }
    
    //Establecer la posicion del boton de derecha
    func setPositionButtonRight (point: CGPoint){
        self.buttonRightImage.position = point
    }
    
    func getPositionButtonRight () -> CGPoint{
        return self.buttonRightImage.position
    }
    
    //Establecer la posicion del boton de nitro
    func setPositionButtonNitro (point: CGPoint){
        self.buttonNitroImage.position = point
    }
    
    func getPositionButtonNitro () -> CGPoint{
        return self.buttonNitroImage.position
    }
    
    //Establecer la posicion del boton de acelerar
    func setPositionButtonAccelerate (point: CGPoint){
        self.buttonAccelerateImage.position = point
    }
    
    func getPositionButtonAccelerate ()->CGPoint{
        return self.buttonAccelerateImage.position
    }
    
    //Establece los metodo de acceso a la variable pressedButton
    func setPressedButton (buttonName: String){
        self.pressedButton = buttonName
    }
    
    func getPressedButton ()-> String{
        return self.pressedButton
    }
}
