//
//  Tile.swift
//  GameOfLife
//
//  Created by Jared Halpern on 12/20/15.
//  Copyright © 2015 Jared Halpern. All rights reserved.
//

import UIKit
import SpriteKit

class Tile: SKSpriteNode {

  var isAlive:Bool = false {
    didSet {
      self.hidden = !isAlive
    }
  }
  
  var numLivingNeighbors = 0
  
  
  
}