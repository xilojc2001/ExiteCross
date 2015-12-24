//
//  Runner.swift
//  ExiteCross
//
//  Created by Jorge Castro on 11/29/15.
//  Copyright © 2015 Xilo. All rights reserved.
//

import SpriteKit

class Runner {
    
    //Definicion de las variables que puede tener el corredor
    private var runnerImage : SKSpriteNode      //Objeto que representa el corredor
    private var tire1Image : SKSpriteNode       //Llanta Delantera
    private var tire2Image : SKSpriteNode       //Llanta Trasera
    private var lane : Int                      //Carril en el que se encuentra ubicado el corredor
    private var isOnGround : Bool               //Indica si el corredor esta en el piso o saltando
    private var velocityY : CGFloat             //Indica la velocidad de caida despues de un salto
    private var gravity : CGFloat               //Indica la gravedad que aplica al corredor
    private var positionBaseLine : CGFloat      //Indica la linea base desde la que se hace un salto
    
    
    //Inicializar el objeto
    init (  runnerImage: SKSpriteNode, tire1Image: SKSpriteNode, tire2Image: SKSpriteNode, lane: Int, isOnGround : Bool,
        velocityY : CGFloat, gravity : CGFloat, positionBaseLine: CGFloat  ){
        self.runnerImage = runnerImage
        self.tire1Image = tire1Image
        self.tire2Image = tire2Image
        self.lane = lane
        self.isOnGround = isOnGround
        self.velocityY = velocityY
        self.gravity = gravity
        self.positionBaseLine = positionBaseLine
    }
    
    //Establecer la posicion del corredor
    func setRunnerPosition (point: CGPoint){
        self.runnerImage.position = point
        
        self.tire1Image.position = CGPointMake(point.x + (runnerImage.size.width / 2.9) , point.y - (tire1Image.size.height * 0.5))
        self.tire2Image.position = CGPointMake(point.x - (runnerImage.size.width / 2.4) , point.y - (tire2Image.size.height * 0.5))
    }
    
    func getRunnerPosition () -> CGPoint{
        return self.runnerImage.position
    }
    
    func setRunnerPositionY (pointY: CGFloat){
        self.runnerImage.position.y = pointY
        
        self.tire1Image.position.y = pointY - (tire1Image.size.height * 0.5)
        self.tire2Image.position.y = pointY - (tire2Image.size.height * 0.5)
    }
    
    func setRunnerOnlyPositionY (pointY: CGFloat){
        self.runnerImage.position.y = pointY
    }
    
    func getRunnerPositionY () -> CGFloat{
        return self.runnerImage.position.y
    }
    
    func setRunnerTirePositionY (tireName: String, pointY: CGFloat){
        if tireName == "tire1" {
            self.tire1Image.position.y = pointY
        } else {
            self.tire2Image.position.y = pointY
        }
    }
    
    func setRunnerPositionX (pointX: CGFloat){
        self.runnerImage.position.x = pointX
        
        self.tire1Image.position.x = pointX + (runnerImage.size.width / 2.9)
        self.tire2Image.position.x = pointX - (runnerImage.size.width / 2.4)
    }
    
    func setRunnerOnlyPositionX (pointX: CGFloat){
        self.runnerImage.position.x = pointX
    }
    
    func setRunnerTirePositionX (tireName: String, pointX: CGFloat){
        if tireName == "tire1" {
            self.tire1Image.position.x = pointX
        } else {
            self.tire2Image.position.x = pointX
        }
    }
    
    func getRunnerPositionX () -> CGFloat{
        return self.runnerImage.position.x
    }
    
    func setRunnerImage (node: SKSpriteNode){
        self.runnerImage = node
    }
    
    func getRunnerImage () ->SKSpriteNode{
        return self.runnerImage
    }
    
    func setTireImage (tireName: String, node: SKSpriteNode){
        if tireName == "tire1" {
            self.tire1Image = node
        } else {
            self.tire2Image = node
        }        
    }
    
    func getTireImage (tireName: String) -> SKSpriteNode{
        if tireName == "tire1" {
            return self.tire1Image
        } else {
            return self.tire2Image
        }
    }
    
    //Establece el carril en el que se encuentra el corredor
    func setLane (lane: Int){
        self.lane = lane
    }
    
    func getLane ()->Int{
        return self.lane
    }
    
    //Establece si el corredor esta en la pista o saltando
    func setIsOnGround (isOnGround: Bool){
        self.isOnGround = isOnGround
    }
    
    func getIsOnGround ()-> Bool{
        return self.isOnGround
    }
    
    //Establece la velocidad de caida
    func setVelocityY (velocityY: CGFloat){
        self.velocityY = velocityY
    }
    
    func getVelocityY ()-> CGFloat{
        return self.velocityY
    }
    
    //Establece la gravedad de caida
    func setGravity (gravity: CGFloat){
        self.gravity = gravity
    }
    
    func getGravity ()-> CGFloat{
        return self.gravity
    }
    
    //Establece la linea base desde la que se hace un salto
    func setPositionBaseLine (positionBaseLine: CGFloat){
        self.positionBaseLine = positionBaseLine
    }
    
    func getPositionBaseLine ()-> CGFloat{
        return self.positionBaseLine
    }
    
    //Funcion encargada de animar las llantas
    func animatedTires (backgroudSpeed: Int){
        if backgroudSpeed != 0{
            tire1Image.zRotation -= CGFloat (1.5)
            tire2Image.zRotation -= CGFloat (1.5)
        }
    }
    
    //Mueve al jugador a un carril especifico
    func movetoLane (frame: CGRect, backgroundImage: SKSpriteNode ){
        //Determinar la posicion correspondiente al carril para ubicar la moto y las llantas
        switch lane {
        case 1:
            self.setRunnerPosition(CGPointMake(CGRectGetMinX (frame) + (self.getRunnerImage().size.width * 2) ,
                CGRectGetMinY (frame) + (backgroundImage.size.height / 2 ) + (self.getRunnerImage().size.height * 1.3 ) ))
        case 2:
            self.setRunnerPosition(CGPointMake(CGRectGetMinX (frame) + (self.getRunnerImage().size.width * 2) ,
                CGRectGetMinY (frame) + (backgroundImage.size.height / 2 ) + (self.getRunnerImage().size.height * 1.9 ) ))
        case 3:
            self.setRunnerPosition(CGPointMake(CGRectGetMinX (frame) + (self.getRunnerImage().size.width * 2) ,
                CGRectGetMinY (frame) + (backgroundImage.size.height / 2 ) + (self.getRunnerImage().size.height * 2.5 ) ))
        case 4:
            self.setRunnerPosition(CGPointMake(CGRectGetMinX (frame) + (self.getRunnerImage().size.width * 2) ,
                CGRectGetMinY (frame) + (backgroundImage.size.height / 2 ) + (self.getRunnerImage().size.height * 3.1 ) ))
        default:
            print("No se ha definido un carril valido")
        }
        
        //Se establece la nueva linea base en caso de un salto
        self.setPositionBaseLine(self.getRunnerPositionY())        
    }
    
    //Esta funcion controla la caida del salto del corredor
    func jumpFallingControl (){
        if self.getIsOnGround() == false {
            self.setVelocityY(self.getVelocityY() + self.getGravity())
            self.setRunnerPositionY(self.getRunnerPositionY() - self.getVelocityY())
            
            
            if self.getRunnerPositionY() < self.getPositionBaseLine() {
                self.setRunnerPositionY(self.getPositionBaseLine())
                self.setVelocityY(0.0)
                self.setIsOnGround(true)
            }
        }
    }
    
    //Esta funcion controla la inclinación de la moto atras o adelante
    func tiltControl (orientation: String){
        if orientation == "Back"{
            if self.runnerImage.zRotation == 0 {
                self.setRunnerOnlyPositionY(self.getRunnerPositionY()+6.1)
                self.setRunnerOnlyPositionX(self.getRunnerPositionX()-4.5)
                self.runnerImage.zRotation += CGFloat (0.3)
            }
            
        } else {
           self.runnerImage.zRotation -= CGFloat (0.3)
        }       
        
    }
}
