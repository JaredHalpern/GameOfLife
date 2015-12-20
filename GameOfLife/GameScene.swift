//
//  GameScene.swift
//  GameOfLife
//
//  Created by Jared Halpern on 12/19/15.
//  Copyright (c) 2015 Jared Halpern. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  let _gridWidth = 400
  let _gridHeight = 300
  let _numRows = 8
  let _numCols = 10
  let _gridLowerLeftCorner:CGPoint = CGPoint(x: 158, y: 10)
  
  let _populationLabel:SKLabelNode = SKLabelNode(text: "Population")
  let _generationLabel:SKLabelNode = SKLabelNode(text: "Generation")
  var _populationValueLabel:SKLabelNode = SKLabelNode(text: "0")
  var _generationValueLabel:SKLabelNode = SKLabelNode(text: "0")
  var _playButton:SKSpriteNode = SKSpriteNode(imageNamed: "play.png")
  var _pauseButton:SKSpriteNode = SKSpriteNode(imageNamed: "pause.png")
  
  var _tiles:[[SKSpriteNode]] = []
  var _margin = 4
  
  override func didMoveToView(view: SKView) {
    
    let background = SKSpriteNode(imageNamed: "background.png")
    background.anchorPoint = CGPoint(x: 0, y: 0)
    background.size = self.size
    background.zPosition = -2
    background.position = CGPoint(x: 0, y: 0)
    self.addChild(background)
    
    let gridBackground = SKSpriteNode(imageNamed: "grid.png")
    gridBackground.size = CGSize(width: _gridWidth, height: _gridHeight)
    gridBackground.zPosition = -1
    gridBackground.anchorPoint = CGPoint(x: 0, y: 0)
    gridBackground.position = _gridLowerLeftCorner
    self.addChild(gridBackground)
    
    _playButton.position = CGPoint(x: 79, y:  290)
    _playButton.setScale(0.5)
    self.addChild(_playButton)
    _pauseButton.position = CGPoint(x: 79, y: 250)
    _pauseButton.setScale(0.5)
    self.addChild(_pauseButton)
    
    let balloon = SKSpriteNode(imageNamed: "balloon.png")
    balloon.position = CGPoint(x: 79, y: 170)
    balloon.setScale(0.5)
    self.addChild(balloon)
    
    let microscope = SKSpriteNode(imageNamed: "microscope.png")
    microscope.position = CGPoint(x: 79, y: 70)
    microscope.setScale(0.4)
    self.addChild(microscope)
    
    // track num tiles, steps
    _populationLabel.position = CGPoint(x: 79, y: 190)
    _populationLabel.fontName = "Courier"
    _populationLabel.fontSize = 12
    _populationLabel.fontColor = UIColor(red: 0, green: 0.2, blue: 0, alpha: 1)
    self.addChild(_populationLabel)
    
    _generationLabel.position = CGPoint(x: 79, y: 160)
    _generationLabel.fontName = "Courier"
    _generationLabel.fontSize = 12
    _generationLabel.fontColor = UIColor(red: 0, green: 0.2, blue: 0, alpha: 1)
    self.addChild(_generationLabel)
    
    _populationValueLabel.position = CGPoint(x: 79, y: 175)
    _populationValueLabel.fontName = "Courier"
    _populationValueLabel.fontSize = 12
    _populationValueLabel.fontColor = UIColor(red: 0, green: 0.2, blue: 0, alpha: 1)
    self.addChild(_populationValueLabel)
    
    _generationValueLabel.position = CGPoint(x: 79, y: 145)
    _generationValueLabel.fontName = "Courier"
    _generationValueLabel.fontSize = 12
    _generationValueLabel.fontColor = UIColor(red: 0, green: 0.2, blue: 0, alpha: 1)
    self.addChild(_generationValueLabel)
    
    let tileSize = calculateTileSize()
    for r in 0..<_numRows {
      var tileRow:[SKSpriteNode] = []
      for c in 0..<_numCols {
        let tile = SKSpriteNode(imageNamed: "bubble.png")
        tile.size = CGSizeMake(tileSize.width, tileSize.height)
        tile.anchorPoint = CGPointMake(0, 0)
        tile.position = getTilePosition(row: r, column: c)
        self.addChild(tile)
        tileRow.append(tile)
      }
      _tiles.append(tileRow)
    }
    
    
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
  
  func getTilePosition(row r:Int, column c:Int) -> CGPoint
  {
    let tileSize = calculateTileSize()
    let x = Int(_gridLowerLeftCorner.x) + _margin + (c * (Int(tileSize.width) + _margin))
    let y = Int(_gridLowerLeftCorner.y) + _margin + (c * (Int(tileSize.height) + _margin))
    return CGPoint(x: x, y: y)
  }
  
  func calculateTileSize() -> CGSize
  {
    let tileWidth = _gridWidth / _numCols - _margin
    let tileHeight = _gridHeight / _numRows - _margin
    return CGSize(width: tileWidth, height: tileHeight)
  }
  
}
