//
//  Background.swift
//  ExiteCross
//
//  Created by Jorge Castro on 11/28/15.
//  Copyright © 2015 Xilo. All rights reserved.
//

import SpriteKit

class Backgroud {
    
    //Definicion de las posibles variables que pueden definirse para el fondo de pantalla
    private var backImage : SKSpriteNode
    private var originBackImagePositionX : CGFloat
    private var maxBackX : CGFloat
    private var groundSpeed : Int
    
    //Inicializar Variables
    init (backImage: SKSpriteNode, originBackImagePositionX:CGFloat, maxBackX: CGFloat, groundSpeed: Int ){
        self.backImage = backImage
        self.originBackImagePositionX = originBackImagePositionX
        self.maxBackX = maxBackX
        self.groundSpeed = groundSpeed
    }
    
    //Establece la imagen de fondo
    func setBackImage (node: SKSpriteNode){
        self.backImage = node
    }
    
    func getBackImage () -> SKSpriteNode{
        return self.backImage
    }
    
    //Establece la velocidad con la que se mueve el escenario
    func setGroudSpeed (playSpeed: Int){
        self.groundSpeed = playSpeed
    }
    
    func getGroudSpeed () -> Int{
        return self.groundSpeed
    }
    
    //Establece el cuadrante en donde se va a presentar la imagen
    func setAnchorPoint (point: CGPoint){
        self.backImage.anchorPoint = point
    }
    
    func getAnchorPoint () -> CGPoint{
        return self.backImage.anchorPoint
    }
    
    //Establece ela ubicacion maxima posible en el eje X para la imagen de fondo
    func setMaxBackX (number: CGFloat){
        self.maxBackX = number
        self.maxBackX *= -1
    }
    
    func getMaxBackX () -> CGFloat{
        return self.maxBackX
    }
    
    //Establece la posicion original en el eje X para la imagen de fondo
    func setOriginBackImagePositionX (number: CGFloat){
        self.originBackImagePositionX = number
    }
    
    func getOriginBackImagePositionX () -> CGFloat{
        return self.originBackImagePositionX
    }
    
    //Establece la posicion especifica en donde se debe mostrar la imagen de fondo
    func setPosition (point: CGPoint){
        self.backImage.position = point
    }
    
    func getPosition ()-> CGPoint{
        return self.backImage.position
    }
    
    //Funcion encargada de animar el fondo del juego
    func animateScene (){
        if self.groundSpeed != 0{
            //Si la repeticion ha terminado, debe volver a comenzar
            if self.backImage.position.x <= self.maxBackX {
                self.backImage.position.x  = self.originBackImagePositionX
            }
            
            //Desplazar la imagen de fondo
            self.backImage.position.x  -= CGFloat (self.groundSpeed)
        }
    }
}