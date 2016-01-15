//
//  PlayScene.swift
//  ExiteCross
//
//  Created by Jorge Castro on 11/23/15.
//  Copyright © 2015 Xilo. All rights reserved.
//

import SpriteKit

class PlayScene: SKScene{
    
    //Inicializa los objetos
    var background = Backgroud(backImage: SKSpriteNode (imageNamed: ""), originBackImagePositionX: CGFloat (0), maxBackX: CGFloat (0),
                               groundSpeed: 0)
    
    var runner = Runner (runnerImage: SKSpriteNode (imageNamed: ""), tire1Image: SKSpriteNode (imageNamed: "Tire"),
                         tire2Image: SKSpriteNode (imageNamed: "Tire"), lane : 0, isOnGround: true, velocityY: CGFloat(0), gravity: CGFloat(0),
                         positionBaseLine: CGFloat(0))
    
    var controlPanel = ControlPanel (buttonUpImage: SKSpriteNode (imageNamed: "buttonUp"), buttonDownImage: SKSpriteNode (imageNamed: "buttonDown"),
                                     buttonLeftImage: SKSpriteNode (imageNamed: "buttonLeft"), buttonRightImage: SKSpriteNode (imageNamed: "buttonRight"),
                                     buttonNitroImage: SKSpriteNode (imageNamed: "buttonNitro"),
                                     buttonAccelerateImage: SKSpriteNode (imageNamed: "buttonAccelerate"), pressedButton: "")
    
    var obstacles = Obstacles ()
    
    //Inicializa las variables generales de uso en el juego
    let regularSpeed:       Int = 7
    let nitroSpeed:         Int = 12
    var initialGravity:     CGFloat = 0.6
    var inicialVelocityY:   CGFloat = -18.0
    var mediumVelocityY:    CGFloat = -9.0
    var sequencePath:       Int = 0
    let delayTime:          Double = 1.6
    
    //Comentario de prueba de slukad
    //Funcion encargada de inicializar la vista y los controles de pantalla una vez la vista toma el foco
    override func didMoveToView(view: SKView) {
        
        //Se presenta el escenario de juego
        showScene(1 , playSpeed:0)
        
        // Se establece el color de fondo del escenario
        self.backgroundColor = UIColor(hex: 0x8C8E90)
        
        //Se presenta el corredor
        self.showRunner("Runner", initialLane: 1)
        
        //Se presenta el panel de control
        showControlPanel()
        
        //Inicializa y muestra los obstaculos
        showObstacles(1)
    }
    
    //Funcion encargada de las operaciones continuas de la pantalla
    override func update(currentTime: NSTimeInterval) {
       self.background.animateScene ()
       self.runner.animatedTires (background.getGroudSpeed())
       self.runner.jumpFallingControl ()
        
       //Presentacion de los obstaculos cargados para este nivel
       self.obstacles.moveObstacle(0, groundSpeed: background.getGroudSpeed())
       self.obstacles.moveObstacle(1, groundSpeed: background.getGroudSpeed())
       self.obstacles.moveObstacle(2, groundSpeed: background.getGroudSpeed())
       self.obstacles.moveObstacle(3, groundSpeed: background.getGroudSpeed())
    }
    
    //Funcion encargada de mostrar los obstaculos
    func showObstacles (playLevel: Int){
        //Inicializa la configuración de los obstaculos
        self.obstacles.initObstacles(self.frame)
        
        if playLevel == 1 {
            //Los obstaculos que aplican para esta pantalla son el 0,1,2,3 - Se adicionan las imagenes de los obstaculos a la pantalla
            self.addChild (self.obstacles.obsImages[0].backImage)
            self.addChild (self.obstacles.obsImages[1].backImage)
            self.addChild (self.obstacles.obsImages[2].backImage)
            self.addChild (self.obstacles.obsImages[3].backImage)
        }
        
    }
    
    // En esta seccion se establece el comportamiento de los botones
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch : AnyObject in touches{
            let location = touch.locationInNode(self)
            
            if self.nodeAtPoint(location) == self.controlPanel.getButtonUpImage() && self.runner.getLane() != 4 {
                self.runner.setLane(self.runner.getLane()+1)
                self.runner.movetoLane(self.frame, backgroundImage: self.background.getBackImage())
            }
            
            if self.nodeAtPoint(location) == self.controlPanel.getButtonDownImage() && self.runner.getLane() != 1 {
                self.runner.setLane(self.runner.getLane()-1)
                self.runner.movetoLane(self.frame, backgroundImage: self.background.getBackImage())
            }
            
            if self.nodeAtPoint(location) == self.controlPanel.getButtonAccelerateImage() {
                self.background.setGroudSpeed(regularSpeed)
                self.controlPanel.setPressedButton("Accelerate")
            }
            
            if self.nodeAtPoint(location) == self.controlPanel.getButtonNitroImage() {
                self.background.setGroudSpeed(nitroSpeed)
                self.controlPanel.setPressedButton("Nitro")
            }
            
            //Prueba de Salto
            if self.nodeAtPoint(location) == self.controlPanel.getButtonRightImage() && self.runner.getIsOnGround() {
                self.runner.setVelocityY(inicialVelocityY)
                self.runner.setIsOnGround(false)
            }
            
            //Prueba de Inclinación
            if self.nodeAtPoint(location) == self.controlPanel.getButtonLeftImage()  {
                self.runner.tiltControl("Back")
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch : AnyObject in touches{
            let location = touch.locationInNode(self)
            
            //Si los botones de aceleración se dejan de presionar la moto debe desacelerar
            if self.nodeAtPoint(location) == self.controlPanel.getButtonAccelerateImage() {
                self.delay (delayTime){
                    if self.controlPanel.getPressedButton() == "Accelerate" {
                        self.background.setGroudSpeed(0)
                        self.controlPanel.setPressedButton("")
                    }
                }
            }
            
            if self.nodeAtPoint(location) == self.controlPanel.getButtonNitroImage()  {
                self.delay (delayTime){
                    if self.controlPanel.getPressedButton() == "Nitro" {
                        self.background.setGroudSpeed(0)
                        self.controlPanel.setPressedButton("")
                    }
                }
            }
            
            //Prueba de Salto
            if self.nodeAtPoint(location) == self.controlPanel.getButtonRightImage() {
                if self.runner.getVelocityY() < mediumVelocityY {
                   self.runner.setVelocityY(mediumVelocityY)
                }
            }
        }
    }
    
    //Funcion encargada de mostrar el fondo de juego
    func showScene (playLevel: Int, playSpeed: Int){
        //Se determinan las variables que se van a utilizar para la definicion de la escena
        var sceneName = ("")
        
        //Determinar la escena que se debe mostrar
        switch playLevel {
            case 1:
                sceneName = "Background01"
            default:
                print("No se ha definido una escena para mostrar")
        }
        
        //Establece la imagen de la escena
        background.setBackImage(SKSpriteNode (imageNamed: sceneName))
        
        //Se establece la velocidad del escenario
        background.setGroudSpeed (playSpeed)
        
        //Se establece la ubicacion central de la imagen de escenario
        background.setAnchorPoint(CGPoint (x: 0, y : 0.5))
        
        background.setPosition(CGPointMake ( CGRectGetMinX (self.frame), CGRectGetMinY (self.frame) + (background.getBackImage().size.height )))
        
        //Establece la posicion original en el eje X para la imagen de fondo
        background.setOriginBackImagePositionX(background.getBackImage().position.x)
        
        //Establece ela ubicacion maxima posible en el eje X para la imagen de fondo
        background.setMaxBackX(background.getBackImage().size.width - self.frame.size.width)
  
        self.addChild (background.getBackImage())
        
    }
    
    //Funcion encargada de mostrar el corredor
    func showRunner (image: String, initialLane: Int){
        //Establece la imagen del corredor
        runner.setRunnerImage(SKSpriteNode (imageNamed: image))
        
        self.addChild (self.runner.getRunnerImage())
        self.addChild (self.runner.getTireImage("tire1"))
        self.addChild (self.runner.getTireImage("tire2"))
        
        //El carril inicial del jugador es el carril 1
        self.runner.setLane(initialLane)
        self.runner.setGravity(self.initialGravity)
        self.runner.setIsOnGround(true)
        self.runner.movetoLane(self.frame, backgroundImage: self.background.getBackImage())
    }
    
    //Funcion encargada de mostrar el panel de controles del juego
    func showControlPanel (){
        //Se establece la ubicacion del boton hacia arriba
        self.controlPanel.setPositionButtonUp(CGPointMake ( CGRectGetMinX (self.frame) + (self.controlPanel.getButtonUpImage().size.width * 2) , CGRectGetMinY (self.frame) + (self.background.getBackImage().size.height / 2 ) - (self.controlPanel.getButtonUpImage().size.height / 1.8 ) ))
        
        //Se establece la ubicacion del boton hacia abajo
        self.controlPanel.setPositionButtonDown(CGPointMake ( CGRectGetMinX (self.frame) + (self.controlPanel.getButtonDownImage().size.width * 2), CGRectGetMinY (self.frame) +
            (self.background.getBackImage().size.height / 2 ) - (self.controlPanel.getButtonUpImage().size.height )  - (self.controlPanel.getButtonDownImage().size.height * 0.6 )))
        
        //Se establece la ubicacion del boton hacia izquierda
        self.controlPanel.setPositionButtonLeft(CGPointMake ( CGRectGetMinX (self.frame) + self.controlPanel.getButtonLeftImage().size.width, CGRectGetMinY (self.frame) +
            (self.background.getBackImage().size.height / 2 ) - (self.controlPanel.getButtonUpImage().size.height )  - (self.controlPanel.getButtonDownImage().size.height * 0.2 )))
        
        //Se establece la ubicacion del boton hacia derecha
        self.controlPanel.setPositionButtonRight(CGPointMake ( CGRectGetMinX (self.frame) + (self.controlPanel.getButtonRightImage().size.width * 3), CGRectGetMinY (self.frame) +
            (self.background.getBackImage().size.height / 2 ) - (self.controlPanel.getButtonUpImage().size.height )  - (self.controlPanel.getButtonDownImage().size.height * 0.2 )))
        
        //Se establece la ubicacion del boton Nitro
        self.controlPanel.setPositionButtonNitro(CGPointMake ( CGRectGetMaxX (self.frame) - self.controlPanel.getButtonNitroImage().size.width, CGRectGetMinY (self.frame) +
            (self.background.getBackImage().size.height / 2 ) - (self.controlPanel.getButtonUpImage().size.height )  - (self.controlPanel.getButtonDownImage().size.height * 0.2 )))
        
        //Se establece la ubicacion del boton Acelerar
        self.controlPanel.setPositionButtonAccelerate(CGPointMake ( CGRectGetMaxX (self.frame) - self.controlPanel.getButtonNitroImage().size.width - (self.controlPanel.getButtonAccelerateImage().size.width * 1.2), CGRectGetMinY (self.frame) +
            (self.background.getBackImage().size.height / 2 ) - (self.controlPanel.getButtonUpImage().size.height )  - (self.controlPanel.getButtonDownImage().size.height * 0.2 )))
        
        self.addChild(self.controlPanel.getButtonUpImage())
        self.addChild(self.controlPanel.getButtonDownImage())
        self.addChild(self.controlPanel.getButtonLeftImage())
        self.addChild(self.controlPanel.getButtonRightImage())
        self.addChild(self.controlPanel.getButtonNitroImage())
        self.addChild(self.controlPanel.getButtonAccelerateImage())
        
    }
    
    //Funcion para tener un delay de ejecución
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}