//
//  GameManager.swift
//  Where And Why
//
//  Created by Khori Armstrong on 2019-06-27.
//  Copyright © 2019 Sigh. All rights reserved.
//

import Foundation
import SpriteKit


class GameManager: SKSpriteNode {
    
    var battleMngr: BattleManager!
    var worldMngr: WorldManager!
    
    
    // var scene: SKScene?
    var currentScene: GameScene?
    
    var playerData: PlayerData?
    var inventory: Inventory?
    
    
    // *** Singleton Stuff.
    private static var _instance: GameManager?
    static func Instance() -> GameManager {
        return _instance!
    }
    
    
    
    func Initialize() {
        
        
        
        print("GameManager: Created.")
        
        self.battleMngr = nil
        self.worldMngr = nil
        GameManager._instance = self
        
        
        print("GameManager: Initted.")
        
        
        
        
        worldMngr = WorldManager()
        battleMngr = BattleManager()
        //
        playerData = Database.Instance().heroData!
        
        inventory = Inventory()
        
        
        
        print("GameManager: Initialization complete!")
    }
    
    var playState: PlayStates = .None
    enum PlayStates {
        case None
        case Battle
        case World
    }
    
    
    var didBattle: Bool = false
    func doUpdate(_ currentTime: TimeInterval) {
        if playState == .Battle {
            if (battleMngr.isActivated) {
                battleMngr.doUpdate(currentTime)
            }
        }
        else if playState == .World {
            if (worldMngr.isActivated) {
                worldMngr.doUpdate(currentTime)
            }
        }
    }

    
    
    
    
    func StartUpANewGame() {
        inventory?.EmptyOut()
        //
        inventory?.AddItem(what: .Potion)
        inventory?.AddItem(what: .Potion)
        inventory?.AddItem(what: .Potion)
        inventory?.AddItem(what: .Panacea)
        inventory?.AddItem(what: .FireAxe)
        inventory?.AddItem(what: .WaterSword)
        inventory?.AddItem(what: .WindSpear)
    }
    
}




class SomeObj : SKSpriteNode {
}
