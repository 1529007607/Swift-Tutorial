//
//  ImageHelper.swift
//  CLViews
//
//  Created by Andrew Chai on 3/24/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

public class ImageHelper {
    private class func getImage(_ size: CGSize, _ action: (UIGraphicsImageRendererContext) -> Swift.Void, _ action1: () -> Swift.Void) -> UIImage {
        var image: UIImage!
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(size: size)
            image = renderer.image(actions: action)
        } else {
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            action1()
            image = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        return image
    }
    
    public class func takeScreenshot(to view: UIView) -> UIImage {
        return getImage(view.bounds.size, { (ctx) in
            view.layer.render(in: ctx.cgContext)
        }) { 
            view.layer.render(in: UIGraphicsGetCurrentContext()!)
        }
    }
    
    public class func takeScreenshot(to layer: CALayer) -> UIImage {
        return getImage(layer.bounds.size, { (ctx) in
            layer.render(in: ctx.cgContext)
        }, { 
            let ctx = UIGraphicsGetCurrentContext()!
            layer.render(in: ctx)
        })
    }
    
    public class func takeScreenshot(to path: CGPath) -> UIImage {
        return getImage(path.boundingBox.size, { (ctx) in
            ctx.cgContext.addPath(path)
            ctx.cgContext.strokePath()
        }, { 
            let ctx = UIGraphicsGetCurrentContext()!
            ctx.addPath(path)
            ctx.strokePath()
        })
    }
}


