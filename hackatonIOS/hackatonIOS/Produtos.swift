//
//  Produtos.swift
//  hackatonIOS
//
//  Created by HC2MAC13 on 11/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit
import CoreData

class Produtos: NSManagedObject {
    
    static func getAll( _ context : NSManagedObjectContext) -> [Produtos] {
        
        var produtos: [Produtos] = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Produtos")
        do {
            produtos = try context.fetch(request) as! [Produtos]
            
        } catch {
            print("Erro ao recuperar produtos")
        }
        
        return produtos
        
        
    }
    
    
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //let context =

//    static func insertOrUpdate( _ post: Produtos, inContext context: NSManagedObjectContext ){
//        let productCoreData = Produtos(context: context)
//
//
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Produtos")
//
//
////        var postSaida = Post(context: context)
////        do {
////            request.predicate = NSPredicate(format: "id = %@" , String(post.id) )
////            request.returnsObjectsAsFaults = false
////
////            let result = try context.fetch(request)
////            if result.count > 0{
////                postSaida = result[0] as! Post
////            }
////
////            postSaida.id = post.id
////            postSaida.title = post.title
////            postSaida.body = post.body
////            try context.save()
////
////        } catch {
////
////            print("Failed \(error)")
////        }
//
////        return postSaida
//    }
    
//    static func getAll(inContext context: NSManagedObjectContext ) -> [CodablePost]{
//        let request: NSFetchRequest<Post> = Post.fetchRequest()
//        let results = try? context.fetch(request)
//        var saida: [CodablePost] = []
//        if results != nil{
//            for post in results!{
//                let codablePost = CodablePost(id: post.id , userId: 0, title: post.title ?? "" , body: post.body ?? "" )
//                saida.append(codablePost)
//            }
//        }
//        return saida
//
//    }
    
    
}
