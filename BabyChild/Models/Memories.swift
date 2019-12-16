//
//  Memories.swift
//  BabyChild
//
//  Created by Nazar on 14/12/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData


class Memories: ObservableObject{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var albums: [Album] = []
    @Published var notes: [Note] = []
    
    init(childid: Int){
        fetchAlbums(childid: childid)
        fetchNotes(childid: childid)
    }
    
    func fetchAlbums(childid: Int){
        let request: NSFetchRequest<Album> = Album.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "time", ascending: false)]
        request.predicate = NSPredicate(format: "childid == %@", NSNumber(value: childid))
        do {
            albums = try context.fetch(request)
        } catch {
            print("Error fetching memories, \(error)")
        }
    }
    
    func fetchNotes(childid: Int){
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "time", ascending: false)]
        request.predicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "type = %@", "memory"), NSPredicate(format: "childid = %@", NSNumber(value: childid))])
        do {
        notes = try context.fetch(request)
        } catch {
            print("Error fetching memories, \(error)")
        }
    }
    
    func saveContext() {
        if context.hasChanges{
            do {
                try context.save()
            } catch  {
                print("Error while saving child, \(error)")
            }
        }
    }
    
    func addMemory(title: String, time: Date, picture: UIImage?, notename: String, notetime: Date, timenote: String) -> Bool{
        let album = addAlbum(title: title, time: time)
        if album != nil && picture != nil {
            _ = addPicture(picture: picture, album: album!)
        }
        if timenote != ""{
            let note = addNote(name: notename, time: notetime, timenote: timenote)
            
            if album == nil && note == nil{
                return false
            } else if note != nil{
                    fetchNotes(childid: DataHelper.fetchChild()!)
                if album == nil{
                    return true
                }
            }
        }
        if album == nil{
            return false
        }
        
        fetchAlbums(childid: DataHelper.fetchChild()!)
        
        return true
    }
    
    func addPicture(picture: UIImage?, album: Album) -> Media?{
        if picture == nil{
            return nil
        }
        
        let new = Media(context: context)
        new.image = TC.ImageToBinary(picture: picture!) as Data
        new.thumbnail = TC.ImageToBinary(picture: picture!, quality: 0.7) as Data
        new.albums = album
        saveContext()
        
        saveContext()
        fetchAlbums(childid: DataHelper.fetchChild()!)
        
        return new
    }
    
    func addNote(name: String, time: Date, timenote: String) -> Note?{
        if name == "" && timenote == ""{
            return nil
        }
    
        let new = Note(context: context)
        new.name = name
        new.time = time
        new.timenote = timenote
        new.type = "memory"
        new.childid = Int32(DataHelper.fetchChild()!)

        saveContext()
        return new
    }
    
    func addAlbum(title: String, time: Date) -> Album?{
        if title == ""{
            return nil
        }
        
        let new = Album(context: context)
        new.title = title
        new.time = time
        new.childid = Int32(DataHelper.fetchChild()!)
        
        saveContext()
        return new
    }
    
    func deleteAlbum(album: Album){
        context.delete(album)
        fetchAlbums(childid: DataHelper.fetchChild()!)
    }
}
