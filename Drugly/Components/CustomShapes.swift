//
//  SwiftUIView.swift
//  Drugly
//
//  Created by boshFbt on 25/01/2024.
//

import SwiftUI

struct mouj:Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX,y:rect.midY))
        
        path.addQuadCurve(to: CGPoint(x:rect.midX, y: rect.midY), control: CGPoint(x: rect.width * 0.40 , y: rect.height * 0.40))
        
        path.addQuadCurve(to:CGPoint(x: rect.maxX, y:rect.midY),
                          control:(CGPoint(x:rect.width * 0.65 , y: rect.height * 0.65)))
        
        path.addLine(to:CGPoint(x:rect.maxX, y:rect.maxY ))
        path.addLine(to:CGPoint(x:rect.minX, y:rect.maxY))
        return path
    }
}

struct secondMouj:Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to:CGPoint(x:rect.minX,y:rect.maxY))
        path.addQuadCurve(to: CGPoint(x:rect.minX,y:rect.midY), control: CGPoint(x: rect.width * 0.59, y: rect.height * 0.70))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x:rect.width,y:rect.height * 0.8))
        path.addLine(to:CGPoint(x:rect.maxX, y:rect.maxY ))
        path.addLine(to:CGPoint(x:rect.minX, y:rect.maxY))
//        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x:rect.width*0.23,y:rect.height*0.3))
        return path
    }
}
struct CustomShapes: View {
    var body: some View {
        VStack{
        Spacer()
        Spacer()
            secondMouj()
            secondMouj()
            .foregroundStyle(Color.black)
//            .ignoresSafeArea()
    }
    }
}

#Preview {
    CustomShapes()
}
