//
//  NewsContainer.swift
//  tabnoticias
//
//  Created by Wilsley Germano on 21/09/23.
//

import Foundation
import SwiftUI

struct NewsContainer: View{
    let title: String?
    let newsBody: String?
    let autor: String?
    let coins: Int?
    let comments: Int?
    let createdAt: String?
    
    private let alignment: HorizontalAlignment = .leading
    private let error: String = "Something Went Wrong"
    private let timeFormatter = TimeFormatter()
    
    private let iconSize: CGFloat = 12
    
    
    var body: some View {
        VStack(alignment:alignment, spacing: 8) {
            Text(title ?? error)
                .font(Font.headline)
            
                .frame(height: 50)

            HStack(spacing: 16){
                Text(autor ?? error)
                Spacer()
                Label("\(comments ?? 0)", systemImage: "message")
                    .lineLimit(1)
                    .font(.system(size: iconSize))
                
                Label("\(coins ?? 0)", systemImage: "trophy")
                    .lineLimit(1)
                    .font(.system(size: iconSize))
                
                Label(createdAt != nil ? timeFormatter.relativeTime(from: createdAt!) : "N/A", systemImage: "clock")
                    .lineLimit(1)
                    .font(.system(size: iconSize))
                
            }
            .foregroundColor(Color.gray)
            
            Divider()
            
        }
        
        .padding([.horizontal], 16)
        
        
    }
    
    
}
