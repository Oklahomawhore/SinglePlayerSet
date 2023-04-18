//
//  SwiggleShape.swift
//  SinglePlayerSet
//
//  Created by Wangshu Zhu on 2023/4/18.
//

import SwiftUI

struct SwiggleShape: Shape {
    
    var horizontalPadding: CGFloat = 5
    var verticalPadding: CGFloat = 5
    var cornerRadius: CGFloat = 15
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let height = rect.size.width * 2/3
        
        let smallWiggle = 0.4 * rect.size.width
        
        let leftDownArcStart = CGPoint(x: horizontalPadding, y: rect.size.height / 2 + height / 2 - cornerRadius - verticalPadding)
        let leftDownArcMid = CGPoint(x: horizontalPadding, y: rect.size.height / 2 + height / 2 - verticalPadding)
        let leftDownArcEnd = CGPoint(x: horizontalPadding + cornerRadius, y: rect.size.height / 2 + height / 2 - verticalPadding)
        
        let controlPoint1_up = CGPoint(x: rect.size.width / 2 - smallWiggle, y: rect.size.height / 2 - height / 2)
        let controlPoint1_down = CGPoint(x: rect.size.width / 2 + smallWiggle, y: rect.size.height / 2  + height / 2 )
        
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        
        let topRightArcStart = CGPoint(x: rect.size.width - horizontalPadding - cornerRadius, y: verticalPadding + (rect.size.height - height) / 2)
        let topRightArcMid = CGPoint(x: rect.size.width - horizontalPadding, y: rect.size.height / 2 - height / 2 + verticalPadding)
        let topRightArcEnd = CGPoint(x: rect.size.width - horizontalPadding, y: (rect.size.height - height) / 2 + cornerRadius + verticalPadding)
        
        path.move(to: leftDownArcStart)
        path.addCurve(to: topRightArcStart, control1: controlPoint1_up, control2: center)
        path.addArc(tangent1End: topRightArcMid, tangent2End: topRightArcEnd, radius: cornerRadius)
        path.addCurve(to: leftDownArcEnd, control1: controlPoint1_down, control2: center)
        path.addArc(tangent1End: leftDownArcMid, tangent2End: leftDownArcStart, radius: cornerRadius)
        
        return path
    }
    
    
}



struct Swiggle_Preview: PreviewProvider {
    
    static var previews: some View {
        VStack {
            SwiggleShape()
                .fill(.red)
        }
    }
}
