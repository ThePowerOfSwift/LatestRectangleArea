func largestRectangleArea(_ heights: [Int]) -> Int {
    var widths = [Int](repeating: 1, count: heights.count)
    var stack: [Int] = []
    var largestRectangleArea = 0
    
    // calc left half of width for each reference histogram bar
    for i in 0 ..< heights.count {
        while let sIdx = stack.last {
            if heights[sIdx] < heights[i] {
                break
            }
            stack.removeLast()
        }
        if let sIdx = stack.last {
            widths[i] += i - sIdx - 1
        } else {
            widths[i] += i
        }
        stack.append(i)
    }
    
    stack.removeAll(keepingCapacity: true)
    
    // calc right half of width for each reference histogram bar while find out
    // the largest rectangle
    /*
     var i = heights.count - 1
     while i >= 0 {
     
     while let sIdx = stack.last {
     if heights[sIdx] < heights[i] {
     break
     }
     stack.removeLast()
     }
     if let sIdx = stack.last {
     widths[i] += sIdx - i - 1
     } else {
     widths[i] += heights.count - 1 - i
     }
     stack.append(i)
     
     largestRectangleArea = max(widths[i] * heights[i], largestRectangleArea)
     
     i -= 1
     }
     */
    
    for i in (0...heights.count - 1).reversed() {
        while let sIdx = stack.last {
            if heights[sIdx] < heights[i] {
                break
            }
            stack.removeLast()
        }
        if let sIdx = stack.last {
            widths[i] += sIdx - i - 1
        } else {
            widths[i] += heights.count - 1 - i
        }
        stack.append(i)
        
        largestRectangleArea = max(widths[i] * heights[i], largestRectangleArea)
    }
    
    return largestRectangleArea
}


let items = [111, 33, 55, 556, 100011, 111, 2, 44, 55, 8]
print("Area = \(items)")

let test = largestRectangleArea(items)
print("largestRectangleArea = \(test)")
