//
//  ViewController.swift
//  QuadradosExplosivos
//
//  Created by HC2MAC13 on 25/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDynamicAnimatorDelegate {

    private let kSquareSize = CGSize(width: 40, height: 40)
    private var animator: UIDynamicAnimator?
    private var behavior: SquareBehavior?
    private var quadradinhos = [UIView]()
    weak var timer: Timer?
    
    
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var tabuleiro: UIView!{
        didSet{
            animator = UIDynamicAnimator(referenceView: tabuleiro)
            animator?.delegate = self
            
            behavior = SquareBehavior()
            animator?.addBehavior(behavior!)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(criarQuadradoOnTap(_:)))
            tabuleiro.isUserInteractionEnabled = true
            tabuleiro.addGestureRecognizer(tap)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [unowned self] (timer) in
            
            var contador = Int(self.counter.text!)!
            if contador == 0{
                self.explodir()
                contador = 30
            }else{
                contador = contador - 1
            }
            self.counter.text = String(contador)
            
            
            
        })
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onRain(_ sender: UIButton) {
        
        var ponto = CGPoint(x: 0, y: 0)
        var x = arc4random() % UInt32(tabuleiro.bounds.size.width)
        x = x / UInt32(kSquareSize.width)
        ponto.x = CGFloat(x) * kSquareSize.width
        criarQuadrado(ponto)
       
    }
    
    @objc func criarQuadradoOnTap( _ sender : UITapGestureRecognizer){
        let posicao = sender.location(in: tabuleiro)
        criarQuadrado(posicao)
    }
    
    func criarQuadrado( _ origin : CGPoint ){
        let frame = CGRect(origin: origin, size: gerarTamanho())
        let square = UIView(frame: frame)
        square.backgroundColor = gerarCorAleatoria()
        tabuleiro.addSubview(square)
        behavior?.addItem(square)
        quadradinhos.append(square)
      
        
    }
    
    private func gerarCorAleatoria() -> UIColor{
        
        return UIColor(displayP3Red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        
    }
    
    private func gerarTamanho() -> CGSize{
        
        let tamanho = CGFloat(arc4random()%100)
        return CGSize(width: tamanho, height: tamanho)
    }
    
    
    @IBAction func onExplodir(_ sender: UIButton) {
        explodir()
        
    }
    
    func explodir(){
        guard quadradinhos.count > 0 else { return }
        
        quadradinhos.forEach({behavior?.removeItem($0)})
        
        UIView.animate(withDuration: 1, animations: { [unowned self] in
            for quadrado in self.quadradinhos {
                let x = arc4random() % UInt32(self.tabuleiro.bounds.size.width * 5)
                let aux = UInt32(self.tabuleiro.bounds.size.width*2)
                let newX = CGFloat(x) - CGFloat(aux)
                let y = self.tabuleiro.bounds.size.height
                quadrado.center = CGPoint(x: newX, y: -y)
            }
            
            }, completion: { [weak self] (interrupted) in
                self?.quadradinhos.forEach({$0.removeFromSuperview()})
                self?.quadradinhos.removeAll()
        })
        
    }
    
}

