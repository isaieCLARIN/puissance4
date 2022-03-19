//
//  ViewController.swift
//  puissance4
//
//  Created by Isaïe Clarin on 11/03/2022.
//

import UIKit

class ViewController: UIViewController {
	
	var joueur: Int = 0
	var plateau: [Int] = [0, 0, 0, 0, 0, 0, 0,
						  0, 0, 0, 0, 0, 0, 0,
						  0, 0, 0, 0, 0, 0, 0,
						  0, 0, 0, 0, 0, 0, 0,
						  0, 0, 0, 0, 0, 0, 0,
						  0, 0, 0, 0, 0, 0, 0,
						  0, 0, 0, 0, 0, 0, 0]
	
	func initialisation() {
		for i in 0...48 {
			plateau[i] = 0
			(view.viewWithTag(i) as! UIButton).setImage(UIImage(named: "blanc"), for: UIControl.State())
		}
		joueur = 1
	}
	
	

	@IBAction func Case(_ sender: UIButton) {
		let col: Int = ((sender as AnyObject).tag - 1) / 7
//		let col: Int = ((sender as AnyObject).tag - 1) % 7
		var up = 0
		
		print(col)
		
		while plateau[6*7 + col - up] != 0 {
			up += 1
		}
		
		switch col {
			case 0:
				plateau[7-up] = joueur
				if joueur == 1{
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "rouge"), for: UIControl.State())
					break
				}
				else {
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "jaune"), for: UIControl.State())
					break
				}
			case 1:
				plateau[14-up] = joueur
				if joueur == 1{
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "rouge"), for: UIControl.State())
					break
				}
				else {
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "jaune"), for: UIControl.State())
					break
				}
			case 3:
				plateau[21-up] = joueur
				if joueur == 1{
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "rouge"), for: UIControl.State())
					break
				}
				else {
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "jaune"), for: UIControl.State())
					break
				}
			case 4:
				plateau[28-up] = joueur
				if joueur == 1{
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "rouge"), for: UIControl.State())
					break
				}
				else {
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "jaune"), for: UIControl.State())
					break
				}
			case 5:
				plateau[35-up] = joueur
				if joueur == 1{
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "rouge"), for: UIControl.State())
					break
				}
				else {
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "jaune"), for: UIControl.State())
					break
				}
			case 6:
				plateau[42-up] = joueur
				if joueur == 1{
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "rouge"), for: UIControl.State())
					break
				}
				else {
					(view.viewWithTag(7*(col + 1) + up) as! UIButton).setImage(UIImage(named: "jaune"), for: UIControl.State())
					break
				}
			default:
				break
				
		}
		
		if joueur == 1 {
			plateau[(sender as AnyObject).tag - 1%7 * 7] = joueur
			
			joueur = 2
		}
		else {
			plateau[(sender as AnyObject).tag - 1%7 * 7] = joueur
			
			joueur = 1
		}
	}
	
	func Fini(p: [Int], j: Int) -> Bool {
		if !(plateau.contains(0)) {
			//Alerte
			self.initialisation()
			return true
		}
		if Gagne(p: p, j: j) {
			//Alerte
			self.initialisation()
			return true
		}
		return false
	}
	
	func Gagne(p: [Int], j: Int) -> Bool {
		var up = 0
		
		for i in 0...48 {
			if p[i] != 0 {
				up = 0
				for _ in 0...4 {
					if p[i+up] == p[i] {
						up += 1
					}
				}
				if up == 4 {
					return true
				} // Verticale
			}
			if p[i] != 0 {
				up = 0
				for _ in 0...4 {
					if p[i+up] == p[i] {
						up += 7
					}
				}
				if up == 4*7 {
					return true
				} // Horizontale
			}
			if p[i] != 0 {
				up = 0
				for _ in 0...4 {
					if p[i+up] == p[i] {
						up += 8
					}
				}
				if up == 4*8 {
					return true
				} // Oblique 1
			}
			if p[i] != 0 {
				up = 0
				for _ in 0...4 {
					if p[i+up] == p[i] {
						up += 6
					}
				}
				if up == 4*6 {
					return true
				} // Oblique 1
			}
		}
		
		return false
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
}
