#if os(iOS)
	let ctx = UIGraphicsGetCurrentContext()	// iOS
#else
	let contextPtr = NSGraphicsContext.currentContext().graphicsPort()	// OS X
	let opaqueCtx = COpaquePointer(contextPtr)
	let ctx = Unmanaged<CGContext>.fromOpaque(opaqueCtx).takeUnretainedValue()
#endif

// enable the following lines for flipped coordinate systems
// CGContextTranslateCTM(ctx, 0, self.bounds.size.height)
// CGContextScaleCTM(ctx, 1, -1)

/*  Shape   */
let pathRef = CGPathCreateMutable()
CGPathMoveToPoint(pathRef, nil, 72.872, 177.311)
CGPathAddCurveToPoint(pathRef, nil, 72.872, 184.847, 72.024, 190.932, 70.329, 195.567)
CGPathAddCurveToPoint(pathRef, nil, 68.633, 200.202, 66.222, 203.8, 63.094, 206.362)
CGPathAddCurveToPoint(pathRef, nil, 59.967, 208.925, 56.217, 210.639, 51.846, 211.506)
CGPathAddCurveToPoint(pathRef, nil, 47.476, 212.373, 42.615, 212.806, 37.264, 212.806)
CGPathAddCurveToPoint(pathRef, nil, 30.029, 212.806, 24.49, 211.675, 20.647, 209.414)
CGPathAddCurveToPoint(pathRef, nil, 16.803, 207.154, 14.881, 204.441, 14.881, 201.275)
CGPathAddCurveToPoint(pathRef, nil, 14.881, 198.638, 15.955, 196.415, 18.103, 194.606)
CGPathAddCurveToPoint(pathRef, nil, 20.251, 192.797, 23.134, 191.893, 26.751, 191.893)
CGPathAddCurveToPoint(pathRef, nil, 29.464, 191.893, 31.631, 192.628, 33.251, 194.097)
CGPathAddCurveToPoint(pathRef, nil, 34.872, 195.567, 36.209, 197.018, 37.264, 198.449)
CGPathAddCurveToPoint(pathRef, nil, 38.47, 200.032, 39.487, 201.087, 40.316, 201.615)
CGPathAddCurveToPoint(pathRef, nil, 41.145, 202.142, 41.899, 202.406, 42.577, 202.406)
CGPathAddCurveToPoint(pathRef, nil, 44.009, 202.406, 45.102, 201.558, 45.855, 199.862)
CGPathAddCurveToPoint(pathRef, nil, 46.609, 198.167, 46.985, 194.87, 46.985, 189.971)
CGPathAddLineToPoint(pathRef, nil, 46.985, 97.051)
CGPathAddLineToPoint(pathRef, nil, 72.872, 89.929)
CGPathAddLineToPoint(pathRef, nil, 72.872, 177.311)

CGContextSetRGBFillColor(ctx, 0.102, 0.102, 0.102, 1)
CGContextAddPath(ctx, pathRef)
CGContextFillPath(ctx)


/*  Shape 2  */
let pathRef2 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef2, nil, 109.739, 92.416)
CGPathAddLineToPoint(pathRef2, nil, 109.739, 152.215)
CGPathAddCurveToPoint(pathRef2, nil, 109.739, 153.874, 110.06, 155.437, 110.7, 156.907)
CGPathAddCurveToPoint(pathRef2, nil, 111.341, 158.376, 112.226, 159.639, 113.357, 160.694)
CGPathAddCurveToPoint(pathRef2, nil, 114.487, 161.749, 115.806, 162.596, 117.313, 163.237)
CGPathAddCurveToPoint(pathRef2, nil, 118.821, 163.878, 120.441, 164.198, 122.174, 164.198)
CGPathAddCurveToPoint(pathRef2, nil, 124.134, 164.198, 126.36, 163.101, 129.069, 161.202)
CGPathAddCurveToPoint(pathRef2, nil, 133.363, 158.194, 135.965, 156.127, 135.965, 153.685)
CGPathAddCurveToPoint(pathRef2, nil, 135.965, 153.099, 135.965, 92.416, 135.965, 92.416)
CGPathAddLineToPoint(pathRef2, nil, 161.738, 92.416)
CGPathAddLineToPoint(pathRef2, nil, 161.738, 177.311)
CGPathAddLineToPoint(pathRef2, nil, 135.965, 177.311)
CGPathAddLineToPoint(pathRef2, nil, 135.965, 169.398)
CGPathAddCurveToPoint(pathRef2, nil, 132.574, 172.262, 128.956, 174.56, 125.113, 176.293)
CGPathAddCurveToPoint(pathRef2, nil, 121.27, 178.027, 117.539, 178.893, 113.922, 178.893)
CGPathAddCurveToPoint(pathRef2, nil, 109.702, 178.893, 105.783, 178.196, 102.165, 176.802)
CGPathAddCurveToPoint(pathRef2, nil, 98.548, 175.408, 95.383, 173.505, 92.67, 171.093)
CGPathAddCurveToPoint(pathRef2, nil, 89.957, 168.682, 87.828, 165.856, 86.283, 162.615)
CGPathAddCurveToPoint(pathRef2, nil, 84.739, 159.375, 83.966, 155.908, 83.966, 152.215)
CGPathAddLineToPoint(pathRef2, nil, 83.966, 92.416)
CGPathAddLineToPoint(pathRef2, nil, 109.739, 92.416)

CGContextSetRGBFillColor(ctx, 0.102, 0.102, 0.102, 1)
CGContextAddPath(ctx, pathRef2)
CGContextFillPath(ctx)


/*  Shape 3  */
let pathRef3 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef3, nil, 197.881, 177.311)
CGPathAddLineToPoint(pathRef3, nil, 172.221, 177.311)
CGPathAddLineToPoint(pathRef3, nil, 172.221, 58.278)
CGPathAddLineToPoint(pathRef3, nil, 197.881, 51.156)
CGPathAddLineToPoint(pathRef3, nil, 197.881, 177.311)

CGContextSetRGBFillColor(ctx, 0.102, 0.102, 0.102, 1)
CGContextAddPath(ctx, pathRef3)
CGContextFillPath(ctx)


/*  Shape 4  */
let pathRef4 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef4, nil, 208.603, 97.051)
CGPathAddLineToPoint(pathRef4, nil, 234.376, 89.929)
CGPathAddLineToPoint(pathRef4, nil, 234.376, 177.311)
CGPathAddLineToPoint(pathRef4, nil, 208.603, 177.311)
CGPathAddLineToPoint(pathRef4, nil, 208.603, 97.051)

CGContextSetRGBFillColor(ctx, 0.102, 0.102, 0.102, 1)
CGContextAddPath(ctx, pathRef4)
CGContextFillPath(ctx)


/*  Shape 5  */
let pathRef5 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef5, nil, 288.225, 133.451)
CGPathAddCurveToPoint(pathRef5, nil, 285.738, 134.506, 283.232, 135.731, 280.707, 137.124)
CGPathAddCurveToPoint(pathRef5, nil, 278.183, 138.519, 275.884, 140.045, 273.812, 141.703)
CGPathAddCurveToPoint(pathRef5, nil, 271.74, 143.361, 270.062, 145.132, 268.782, 147.015)
CGPathAddCurveToPoint(pathRef5, nil, 267.501, 148.9, 266.86, 150.859, 266.86, 152.894)
CGPathAddCurveToPoint(pathRef5, nil, 266.86, 154.476, 267.067, 156.002, 267.481, 157.472)
CGPathAddCurveToPoint(pathRef5, nil, 267.896, 158.941, 268.48, 160.204, 269.234, 161.259)
CGPathAddCurveToPoint(pathRef5, nil, 269.988, 162.314, 270.816, 163.162, 271.721, 163.802)
CGPathAddCurveToPoint(pathRef5, nil, 272.625, 164.443, 273.605, 164.763, 274.66, 164.763)
CGPathAddCurveToPoint(pathRef5, nil, 276.77, 164.763, 278.899, 164.123, 281.047, 162.841)
CGPathAddCurveToPoint(pathRef5, nil, 283.194, 161.56, 285.587, 159.94, 288.225, 157.981)
CGPathAddLineToPoint(pathRef5, nil, 288.225, 133.451)
CGPathCloseSubpath(pathRef5)
CGPathMoveToPoint(pathRef5, nil, 314.111, 177.311)
CGPathAddLineToPoint(pathRef5, nil, 288.225, 177.311)
CGPathAddLineToPoint(pathRef5, nil, 288.225, 170.528)
CGPathAddCurveToPoint(pathRef5, nil, 286.792, 171.734, 285.399, 172.846, 284.042, 173.863)
CGPathAddCurveToPoint(pathRef5, nil, 282.686, 174.88, 281.16, 175.766, 279.464, 176.519)
CGPathAddCurveToPoint(pathRef5, nil, 277.768, 177.273, 275.866, 177.857, 273.755, 178.272)
CGPathAddCurveToPoint(pathRef5, nil, 271.645, 178.686, 269.158, 178.893, 266.295, 178.893)
CGPathAddCurveToPoint(pathRef5, nil, 262.375, 178.893, 258.853, 178.328, 255.725, 177.198)
CGPathAddCurveToPoint(pathRef5, nil, 252.597, 176.067, 249.941, 174.522, 247.756, 172.563)
CGPathAddCurveToPoint(pathRef5, nil, 245.571, 170.604, 243.893, 168.287, 242.725, 165.611)
CGPathAddCurveToPoint(pathRef5, nil, 241.558, 162.936, 240.973, 160.015, 240.973, 156.85)
CGPathAddCurveToPoint(pathRef5, nil, 240.973, 153.61, 241.595, 150.671, 242.838, 148.033)
CGPathAddCurveToPoint(pathRef5, nil, 244.082, 145.396, 245.778, 143.022, 247.925, 140.911)
CGPathAddCurveToPoint(pathRef5, nil, 250.073, 138.801, 252.579, 136.917, 255.443, 135.259)
CGPathAddCurveToPoint(pathRef5, nil, 258.306, 133.601, 261.377, 132.075, 264.655, 130.681)
CGPathAddCurveToPoint(pathRef5, nil, 267.934, 129.287, 271.344, 128.006, 274.886, 126.838)
CGPathAddCurveToPoint(pathRef5, nil, 278.427, 125.67, 281.932, 124.558, 285.399, 123.503)
CGPathAddLineToPoint(pathRef5, nil, 288.225, 122.825)
CGPathAddLineToPoint(pathRef5, nil, 288.225, 114.459)
CGPathAddCurveToPoint(pathRef5, nil, 288.225, 109.034, 287.188, 105.19, 285.116, 102.929)
CGPathAddCurveToPoint(pathRef5, nil, 283.044, 100.668, 280.274, 99.538, 276.807, 99.538)
CGPathAddCurveToPoint(pathRef5, nil, 272.738, 99.538, 269.912, 100.518, 268.329, 102.477)
CGPathAddCurveToPoint(pathRef5, nil, 266.747, 104.436, 265.955, 106.81, 265.955, 109.599)
CGPathAddCurveToPoint(pathRef5, nil, 265.955, 111.181, 265.786, 112.726, 265.447, 114.233)
CGPathAddCurveToPoint(pathRef5, nil, 265.108, 115.741, 264.523, 117.059, 263.695, 118.19)
CGPathAddCurveToPoint(pathRef5, nil, 262.866, 119.32, 261.679, 120.225, 260.134, 120.903)
CGPathAddCurveToPoint(pathRef5, nil, 258.589, 121.581, 256.649, 121.92, 254.312, 121.92)
CGPathAddCurveToPoint(pathRef5, nil, 250.695, 121.92, 247.756, 120.884, 245.495, 118.812)
CGPathAddCurveToPoint(pathRef5, nil, 243.234, 116.739, 242.104, 114.12, 242.104, 110.955)
CGPathAddCurveToPoint(pathRef5, nil, 242.104, 108.016, 243.102, 105.284, 245.099, 102.76)
CGPathAddCurveToPoint(pathRef5, nil, 247.097, 100.235, 249.79, 98.068, 253.182, 96.26)
CGPathAddCurveToPoint(pathRef5, nil, 256.573, 94.451, 260.492, 93.019, 264.938, 91.964)
CGPathAddCurveToPoint(pathRef5, nil, 269.384, 90.909, 274.094, 90.382, 279.068, 90.382)
CGPathAddCurveToPoint(pathRef5, nil, 285.173, 90.382, 290.429, 90.928, 294.838, 92.021)
CGPathAddCurveToPoint(pathRef5, nil, 299.246, 93.114, 302.883, 94.677, 305.746, 96.712)
CGPathAddCurveToPoint(pathRef5, nil, 308.609, 98.747, 310.72, 101.196, 312.076, 104.06)
CGPathAddCurveToPoint(pathRef5, nil, 313.433, 106.923, 314.111, 110.127, 314.111, 113.668)
CGPathAddLineToPoint(pathRef5, nil, 314.111, 177.311)

CGContextSetRGBFillColor(ctx, 0.102, 0.102, 0.102, 1)
CGContextAddPath(ctx, pathRef5)
CGContextFillPath(ctx)


/*  Shape 6  */
let pathRef6 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef6, nil, 222.772, 84.091)
CGPathAddCurveToPoint(pathRef6, nil, 213.936, 84.091, 206.772, 76.928, 206.772, 68.091)
CGPathAddCurveToPoint(pathRef6, nil, 206.772, 59.255, 213.936, 52.091, 222.772, 52.091)
CGPathAddCurveToPoint(pathRef6, nil, 231.609, 52.091, 238.772, 59.255, 238.772, 68.091)
CGPathAddCurveToPoint(pathRef6, nil, 238.772, 76.928, 231.609, 84.091, 222.772, 84.091)
CGPathCloseSubpath(pathRef6)

CGContextSetRGBFillColor(ctx, 0.835, 0.388, 0.361, 1)
CGContextAddPath(ctx, pathRef6)
CGContextFillPath(ctx)


/*  Shape 7  */
let pathRef7 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef7, nil, 222.772, 50.591)
CGPathAddCurveToPoint(pathRef7, nil, 232.437, 50.591, 240.272, 58.426, 240.272, 68.091)
CGPathAddCurveToPoint(pathRef7, nil, 240.272, 77.756, 232.437, 85.591, 222.772, 85.591)
CGPathAddCurveToPoint(pathRef7, nil, 213.107, 85.591, 205.272, 77.756, 205.272, 68.091)
CGPathAddCurveToPoint(pathRef7, nil, 205.272, 58.426, 213.107, 50.591, 222.772, 50.591)
CGPathCloseSubpath(pathRef7)
CGPathMoveToPoint(pathRef7, nil, 222.772, 53.591)
CGPathAddCurveToPoint(pathRef7, nil, 214.764, 53.591, 208.272, 60.083, 208.272, 68.091)
CGPathAddCurveToPoint(pathRef7, nil, 208.272, 76.099, 214.764, 82.591, 222.772, 82.591)
CGPathAddCurveToPoint(pathRef7, nil, 230.781, 82.591, 237.272, 76.099, 237.272, 68.091)
CGPathAddCurveToPoint(pathRef7, nil, 237.272, 60.083, 230.781, 53.591, 222.772, 53.591)
CGPathCloseSubpath(pathRef7)

CGContextSetRGBFillColor(ctx, 0.796, 0.235, 0.2, 1)
CGContextAddPath(ctx, pathRef7)
CGContextFillPath(ctx)


/*  Shape 8  */
let pathRef8 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef8, nil, 60.454, 84.091)
CGPathAddCurveToPoint(pathRef8, nil, 51.618, 84.091, 44.454, 76.928, 44.454, 68.091)
CGPathAddCurveToPoint(pathRef8, nil, 44.454, 59.255, 51.618, 52.091, 60.454, 52.091)
CGPathAddCurveToPoint(pathRef8, nil, 69.291, 52.091, 76.454, 59.255, 76.454, 68.091)
CGPathAddCurveToPoint(pathRef8, nil, 76.454, 76.928, 69.291, 84.091, 60.454, 84.091)
CGPathCloseSubpath(pathRef8)

CGContextSetRGBFillColor(ctx, 0.4, 0.51, 0.878, 1)
CGContextAddPath(ctx, pathRef8)
CGContextFillPath(ctx)


/*  Shape 9  */
let pathRef9 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef9, nil, 60.454, 50.591)
CGPathAddCurveToPoint(pathRef9, nil, 70.119, 50.591, 77.954, 58.426, 77.954, 68.091)
CGPathAddCurveToPoint(pathRef9, nil, 77.954, 77.756, 70.119, 85.591, 60.454, 85.591)
CGPathAddCurveToPoint(pathRef9, nil, 50.789, 85.591, 42.954, 77.756, 42.954, 68.091)
CGPathAddCurveToPoint(pathRef9, nil, 42.954, 58.426, 50.789, 50.591, 60.454, 50.591)
CGPathCloseSubpath(pathRef9)
CGPathMoveToPoint(pathRef9, nil, 60.454, 53.591)
CGPathAddCurveToPoint(pathRef9, nil, 52.446, 53.591, 45.954, 60.083, 45.954, 68.091)
CGPathAddCurveToPoint(pathRef9, nil, 45.954, 76.099, 52.446, 82.591, 60.454, 82.591)
CGPathAddCurveToPoint(pathRef9, nil, 68.462, 82.591, 74.954, 76.099, 74.954, 68.091)
CGPathAddCurveToPoint(pathRef9, nil, 74.954, 60.083, 68.462, 53.591, 60.454, 53.591)
CGPathCloseSubpath(pathRef9)

CGContextSetRGBFillColor(ctx, 0.251, 0.388, 0.847, 1)
CGContextAddPath(ctx, pathRef9)
CGContextFillPath(ctx)


/*  Shape 10  */
let pathRef10 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef10, nil, 264.821, 84.091)
CGPathAddCurveToPoint(pathRef10, nil, 255.984, 84.091, 248.821, 76.928, 248.821, 68.091)
CGPathAddCurveToPoint(pathRef10, nil, 248.821, 59.255, 255.984, 52.091, 264.821, 52.091)
CGPathAddCurveToPoint(pathRef10, nil, 273.658, 52.091, 280.821, 59.255, 280.821, 68.091)
CGPathAddCurveToPoint(pathRef10, nil, 280.821, 76.928, 273.658, 84.091, 264.821, 84.091)
CGPathCloseSubpath(pathRef10)

CGContextSetRGBFillColor(ctx, 0.667, 0.475, 0.757, 1)
CGContextAddPath(ctx, pathRef10)
CGContextFillPath(ctx)


/*  Shape 11  */
let pathRef11 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef11, nil, 264.821, 50.591)
CGPathAddCurveToPoint(pathRef11, nil, 274.486, 50.591, 282.321, 58.426, 282.321, 68.091)
CGPathAddCurveToPoint(pathRef11, nil, 282.321, 77.756, 274.486, 85.591, 264.821, 85.591)
CGPathAddCurveToPoint(pathRef11, nil, 255.156, 85.591, 247.321, 77.756, 247.321, 68.091)
CGPathAddCurveToPoint(pathRef11, nil, 247.321, 58.426, 255.156, 50.591, 264.821, 50.591)
CGPathCloseSubpath(pathRef11)
CGPathMoveToPoint(pathRef11, nil, 264.821, 53.591)
CGPathAddCurveToPoint(pathRef11, nil, 256.813, 53.591, 250.321, 60.083, 250.321, 68.091)
CGPathAddCurveToPoint(pathRef11, nil, 250.321, 76.099, 256.813, 82.591, 264.821, 82.591)
CGPathAddCurveToPoint(pathRef11, nil, 272.829, 82.591, 279.321, 76.099, 279.321, 68.091)
CGPathAddCurveToPoint(pathRef11, nil, 279.321, 60.083, 272.829, 53.591, 264.821, 53.591)
CGPathCloseSubpath(pathRef11)

CGContextSetRGBFillColor(ctx, 0.584, 0.345, 0.698, 1)
CGContextAddPath(ctx, pathRef11)
CGContextFillPath(ctx)


/*  Shape 12  */
let pathRef12 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef12, nil, 243.799, 47.672)
CGPathAddCurveToPoint(pathRef12, nil, 234.962, 47.672, 227.799, 40.509, 227.799, 31.672)
CGPathAddCurveToPoint(pathRef12, nil, 227.799, 22.836, 234.962, 15.672, 243.799, 15.672)
CGPathAddCurveToPoint(pathRef12, nil, 252.636, 15.672, 259.799, 22.836, 259.799, 31.672)
CGPathAddCurveToPoint(pathRef12, nil, 259.799, 40.509, 252.636, 47.672, 243.799, 47.672)
CGPathCloseSubpath(pathRef12)

CGContextSetRGBFillColor(ctx, 0.376, 0.678, 0.318, 1)
CGContextAddPath(ctx, pathRef12)
CGContextFillPath(ctx)


/*  Shape 13  */
let pathRef13 = CGPathCreateMutable()
CGPathMoveToPoint(pathRef13, nil, 243.799, 14.172)
CGPathAddCurveToPoint(pathRef13, nil, 253.464, 14.172, 261.299, 22.007, 261.299, 31.672)
CGPathAddCurveToPoint(pathRef13, nil, 261.299, 41.337, 253.464, 49.172, 243.799, 49.172)
CGPathAddCurveToPoint(pathRef13, nil, 234.134, 49.172, 226.299, 41.337, 226.299, 31.672)
CGPathAddCurveToPoint(pathRef13, nil, 226.299, 22.007, 234.134, 14.172, 243.799, 14.172)
CGPathCloseSubpath(pathRef13)
CGPathMoveToPoint(pathRef13, nil, 243.799, 17.172)
CGPathAddCurveToPoint(pathRef13, nil, 235.791, 17.172, 229.299, 23.664, 229.299, 31.672)
CGPathAddCurveToPoint(pathRef13, nil, 229.299, 39.681, 235.791, 46.172, 243.799, 46.172)
CGPathAddCurveToPoint(pathRef13, nil, 251.807, 46.172, 258.299, 39.681, 258.299, 31.672)
CGPathAddCurveToPoint(pathRef13, nil, 258.299, 23.664, 251.807, 17.172, 243.799, 17.172)
CGPathCloseSubpath(pathRef13)

CGContextSetRGBFillColor(ctx, 0.22, 0.596, 0.149, 1)
CGContextAddPath(ctx, pathRef13)
CGContextFillPath(ctx)

