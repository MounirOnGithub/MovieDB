//
//  Netflix_CloneApp.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 31/08/2023.
//

import SwiftUI

@main
struct Netflix_CloneApp: App {
    @State private var userData = UserData(favouriteMovieIds: [])
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userData)
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                // à compléter
            } else {
                // à compléter
            }
        }
    }
    
    private func saveData() {
        do {
            let data = try JSONSerialization.data(withJSONObject: Array(userData.favouriteMovieIds))
            let jsonString = String(data: data, encoding: .utf8)
            
            // Sauvegarde des données dans le fichier data.json
            if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("data.json") {
                do {
                    try jsonString?.write(to: fileURL, atomically: true, encoding: .utf8)
                    print("Données JSON écrites avec succès dans le fichier : \(fileURL.path)")
                } catch {
                    print("Erreur lors de l'écriture des données JSON dans le fichier : \(error)")
                }
            }
        } catch {
            print("Erreur de serialisation")
        }
    }
}
