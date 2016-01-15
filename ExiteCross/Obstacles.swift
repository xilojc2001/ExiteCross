//
//  Obstacles.swift
//  ExiteCross
//
//  Created by Jorge Castro on 1/14/16.
//  Copyright © 2016 Xilo. All rights reserved.
//

import SpriteKit

class Obstacles {

    //Estructura en la que se va almacenar la infromación de los posibles obstaculos
    struct Obstacle {
        var backImage : SKSpriteNode = SKSpriteNode (imageNamed: "")
        var lane : Int = 0
        var positionX : CGFloat = CGFloat(0)
        var positionY : CGFloat = CGFloat(0)
        
    }
    
    //Arreglo que almacena las difentes imagenes que se van a utilizar como obstaculos
    var obsImages : [Obstacle] = []
    
    //Esta funcion es la que se va a encargar de inicializar el arreglo de obstaculos
    func initObstacles(frame: CGRect, distance: CGFloat){
        
        //Creo los objetos para configurar los obstaculos
        var Obs0 = Obstacle()
        var Obs1 = Obstacle()
        
        //Configuro los obstaculos
        Obs0.backImage = SKSpriteNode (imageNamed: "ramp00")
        Obs0.lane = 0 //El paramero en cero indica que ocupa los 4 carriles
        Obs0.positionY = CGRectGetMinY (frame) + (Obs0.backImage.size.height*1.52)
        Obs0.positionX = CGRectGetMaxX (frame) + (Obs0.backImage.size.width)
        Obs0.backImage.zPosition = 50
        Obs0.backImage.position = CGPointMake(Obs0.positionX ,Obs0.positionY)
        
        Obs1.backImage = SKSpriteNode (imageNamed: "ramp01")
        Obs1.lane = 0 //El paramero en cero indica que ocupa los 4 carriles
        Obs1.positionY = CGRectGetMinY (frame) + (Obs1.backImage.size.height * 1.8)
        Obs1.positionX = CGRectGetMaxX (frame) + (Obs1.backImage.size.width * distance)
        Obs1.backImage.zPosition = 50
        Obs1.backImage.position = CGPointMake(Obs1.positionX ,Obs1.positionY)
      
        //Adiciono los obstaculos al arreglo
        obsImages.append(Obs0)
        obsImages.append(Obs1)
    }
    
    //Funcion que se encarga de mover el obstaculo en la pantalla
    func moveObstacle (id:Int, groundSpeed: Int){
        obsImages[id].positionX -= CGFloat (groundSpeed)
        obsImages[id].backImage.position.x -= CGFloat (groundSpeed)
    }
    
    //Retorna la posicion del obstaculo de acuerdo con el ID
    func getPosition (id:Int) -> CGPoint {
        return CGPointMake ( obsImages[id].positionX , obsImages[id].positionY)
    }
    
}