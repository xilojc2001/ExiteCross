//
//  Obstacles.swift
//  ExiteCross
//
//  Created by Jorge Castro on 1/14/16.
//  Copyright © 2016 Xilo. All rights reserved.
//

import SpriteKit

class Obstacles {

    //Estructura que almacena la configuración base de los obsatculos
    struct obstacleConfig {
        var backImage : SKSpriteNode = SKSpriteNode (imageNamed: "")
        var imageName : String = ""
    }
    
    //Estructura en la que se va almacenar la infromación de los posibles obstaculos
    struct obstacle {
        var node : SKSpriteNode = SKSpriteNode (imageNamed: "")
    }
    
    //Arreglo que almacena las difentes imagenes que se van a utilizar como obstaculos
    var obstaclesArray : [obstacle] = []
    var obstaclesConfigArray : [obstacleConfig] = []
    
    //Esta funcion es la que se va a encargar de inicializar el arreglo de obstaculos
    func initObstacles(frame: CGRect, playLevel: Int){
        var obsQuantity = 0
        
        switch playLevel{
            case 1: obsQuantity = 19 //Para el nivel 1 se manejan 20 obstaculos
            default: obsQuantity = 0
        }
        
        //Se adicionan 20 obstaculo a partir de los obstaculos configurados
        for counter in 0...obsQuantity{
            var newObs = obstacle()
            let index : Int = Int.random(0...obstaclesConfigArray.count-1)
            
            newObs.node = SKSpriteNode (imageNamed: obstaclesConfigArray[index].imageName)
            newObs.node.position.y = obstaclesConfigArray[index].backImage.position.y
            newObs.node.zPosition = obstaclesConfigArray[index].backImage.zPosition
            
            if counter == 0 {
                newObs.node.position.x = CGRectGetMaxX (frame) + obstaclesConfigArray[index].backImage.size.width
            }else{
                newObs.node.position.x = obstaclesArray[obstaclesArray.count-1].node.position.x + (obstaclesConfigArray[index].backImage.size.width *  CGFloat(Int.random(2...6)))
            }

            //Adiciono el obstaculo al arreglo
            obstaclesArray.append(newObs)
        }
    }
    
    //Esta funcion es la que se va a encargar de inicializar el arreglo de obstaculos
    func initObstaclesConfig(frame: CGRect){
        
        //Creo los objetos para configurar los obstaculos
        var Obs0 = obstacleConfig()
        var Obs1 = obstacleConfig()        
        
        //Configuro los obstaculos
        Obs0.imageName =  "ramp00"
        Obs0.backImage = SKSpriteNode (imageNamed: Obs0.imageName)
        Obs0.backImage.position.y = CGRectGetMinY (frame) + (Obs0.backImage.size.height*1.52)
        Obs0.backImage.zPosition = 50
        
        Obs1.imageName =  "ramp01"
        Obs1.backImage = SKSpriteNode (imageNamed: Obs1.imageName)
        Obs1.backImage.position.y = CGRectGetMinY (frame) + (Obs1.backImage.size.height * 1.8)
        Obs1.backImage.zPosition = 50
        
        //Adiciono los obstaculos al arreglo
        obstaclesConfigArray.append(Obs0)
        obstaclesConfigArray.append(Obs1)
    }
    
    //Funcion que se encarga de mover el obstaculo en la pantalla
    func moveObstacle (id:Int, groundSpeed: Int){
        obstaclesArray[id].node.position.x -= CGFloat (groundSpeed)
    }
    
}