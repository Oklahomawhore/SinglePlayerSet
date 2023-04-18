//
//  DiamondShape.swift
//  SinglePlayerSet
//
//  Created by Wangshu Zhu on 2023/4/17.
//

import SwiftUI

struct DiamondShape: Shape {
    var factor: CGFloat = 0.9
    var aspectRatio : CGFloat = 3/2
    var count: Int = 1
    //var fillStyle: FillStyle
    
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // split into count spaces
        
        var width = rect.size.width * factor
        var height  = width / aspectRatio
        
        if height > rect.size.height {
            // neet width = rect.size.width
            height = rect.size.height * factor
            width = height * aspectRatio
        }
        
        let start = CGPoint(x: (rect.size.width + width) / 2, y: rect.size.height / 2)
        
        path.move(to: start)
        path.addLine(to: CGPoint(x: rect.size.width / 2, y: (rect.size.height - height) / 2))
        path.addLine(to: CGPoint(x: rect.size.width / 2 - width / 2, y: rect.size.height / 2))
        path.addLine(to: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2 + height / 2))
        path.addLine(to: start)
        
        return path
    }
    
    private func draw(in rect: CGRect,with path: inout Path) {
        
    }
}


struct ShapePreview: PreviewProvider {
    
    static var previews: some View {
        VStack {
            DiamondShape(factor: 0.9, aspectRatio: 3/2, count: 3)
                .fill(.red)
        }
    }
}
