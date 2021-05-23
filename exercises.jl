# Exercise 3 (Julia)
# Create a 2x4 two dimensional matrix with 
# random floats in it and in the next step determine the biggest element.

A = rand(Float64, 2, 4)
#2×4 Matrix{Float64}:
# 0.654797  0.801701   0.0999197  0.257041
# 0.966952  0.0632264  0.284317   0.775155

findmax(A)
#(0.9669517205393454, CartesianIndex(2, 1))

# Exercise 4 (Julia)

# 1. Create two matrices of the same layout and test if addition and 
# subtraction of the matrix works as expected: C = A + B

A = [[1,4]  [2,5]  [3,6]]
B = [[-1,-4]  [-2,-5]  [-3,-7]]
A + B
#2×3 Matrix{Int64}:
# 0  0   0
# 0  0  -1

A - B
#2×3 Matrix{Int64}:
# 2   4   6
# 8  10  13

# 2. Now compare matrix multiplication either this way A * B and this 
# way A .* B. Whats the difference?!

A*B
# ERROR: DimensionMismatch("matrix A has dimensions (2,3), matrix B has dimensions (2,3)")

A .* B
#2×3 Matrix{Int64}:
#  -1   -4   -9
# -16  -25  -42
// The dot operator multiplies element-wise. I'm currently not exactly sure where the error message comes from.

# 3. What about matrix division with "/" or "\"?!
A / B
#2×2 Matrix{Float64}:
# -1.0        0.0
#  0.714286  -1.2
// Division (float): divides the first operand by the second and returns float value

A \ B
#3×3 Matrix{Float64}:
# -0.833333  -0.333333  -0.277778
# -0.333333  -0.333333  -0.444444
#  0.166667  -0.333333  -0.611111
// Division (Inverse): divides the second operand by the first (y/x)

# 4. Create a 3x3 integer matrix A with useful numbers. Now try A+1, A-1, A*2, A/2.
A = [1 2 3; 4 5 6; 7 8 9]
#3×3 Matrix{Int64}:
# 1  2  3
# 4  5  6
# 7  8  9

A + 1
#ERROR: MethodError: no method matching +(::Matrix{Int64}, ::Int64)
#For element-wise addition, use broadcasting with dot syntax: array .+ scalar

A .+ 1
#3×3 Matrix{Int64}:
# 2  3   4
# 5  6   7
# 8  9  10

A - 1
#ERROR: MethodError: no method matching -(::Matrix{Int64}, ::Int64)
#For element-wise subtraction, use broadcasting with dot syntax: array .- scalar

A .- 1
#3×3 Matrix{Int64}:
# 0  1  2
# 3  4  5
# 6  7  8

A * 2
#3×3 Matrix{Int64}:
#  2   4   6
#  8  10  12
# 14  16  18

A .* 2
#3×3 Matrix{Int64}:
#  2   4   6
#  8  10  12
# 14  16  18

A / B
# ERROR: DimensionMismatch("Both inputs should have the same number of columns")

A ./ B
# ERROR: DimensionMismatch("arrays could not be broadcast to a common size; got a dimension with lengths 3 and 2")

# 5. Now multiply a 3x4 matrix with a suitable (4)vector.
A = [1 2 3 5; 5 6 7 8; 9 10 11 12]
#3×4 Matrix{Int64}:
# 1   2   3   5
# 5   6   7   8
# 9  10  11  12

B = [3; 4; 5]
#3-element Vector{Int64}:
# 3
# 4
# 5

A .* B
#3×4 Matrix{Int64}:
#  3   6   9  15
# 20  24  28  32
# 45  50  55  60