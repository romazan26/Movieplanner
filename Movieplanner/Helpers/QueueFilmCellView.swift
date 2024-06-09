//
//  QueueFilmCellView.swift
//  Movieplanner
//
//  Created by Роман on 09.06.2024.
//

import SwiftUI

struct QueueFilmCellView: View {

    @ObservedObject var vm: ViewModel
    
    let film: Film
    
    var body: some View {
        HStack {
            
            //MARK: - Image
            Image(.film)
                .resizable()
                .frame(width: 135, height: 214)
            VStack(alignment: .leading) {
                
                //MARK: - Title
                Text("\(film.title ?? "no title")")
                    .foregroundStyle(.white)
                    .font(.system(size: 23, weight: .heavy))
                Text("\(film.releaseYear ?? "no year")")
                    .foregroundStyle(.gray)
                    .font(.system(size: 17, weight: .heavy))
                
                //MARK: - Ganre
                if let genres = film.genre?.allObjects as? [Genre] {
    
                        ForEach(genres) { genre  in
                                ganreIView(title: genre.name ?? "")
                        }
                    
                }
                
                Spacer()

                    //MARK: - Add to viewed button
                    Button {
                        vm.updataFilmStatus(with: film.id)
                        vm.createViewedFilms()
                        vm.createQueueFilms()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.button)
                            Text("Add to viewed")
                                .foregroundStyle(.white)
                                .font(.system(size: 17, weight: .bold))
                        }.frame(width: 192, height: 47)
                    }
            }
        }
        .frame(width: 330, height: 220)
    }
    }


#Preview {
    QueueFilmCellView(vm: ViewModel(), film: Film())
}