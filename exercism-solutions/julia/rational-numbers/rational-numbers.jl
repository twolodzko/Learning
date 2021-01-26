import Base: +, -, *, /, ^, abs, inv, zero, one, convert, float, ==, <, <=, >, >=, numerator, denominator

struct RationalNumber{T <: Integer} <: Real
    # numerator / denominator = quotient
    numerator::T
    denominator::T

    function RationalNumber(numerator::T, denominator::T) where {T <: Integer}
        if numerator == 0 && denominator == 0
            throw(ArgumentError("Invalid number"))
        end
        cdv = gcd(numerator, denominator)
        sgn = xor(numerator < 0, denominator < 0) ? -1 : 1  # any but not both are negative
        return new{T}(abs(numerator) ÷ cdv * sgn, abs(denominator) ÷ cdv)
    end
end

RationalNumber(numerator) = RationalNumber(numerator, 1)

float(x::RationalNumber) = float(x.numerator / x.denominator)

numerator(x::RationalNumber) = x.numerator
denominator(x::RationalNumber) = x.denominator

show(io::IO, x::RationalNumber) = print(io, "$(x.numerator)//$(x.denominator)")

zero(::Type{RationalNumber{T}}) where {T <: Integer} = RationalNumber(0)
one(::Type{RationalNumber{T}}) where {T <: Integer} = RationalNumber(1)

# Math

function +(x::RationalNumber, y::RationalNumber)
    num = x.numerator * y.denominator + y.numerator * x.denominator
    den = x.denominator * y.denominator
    return RationalNumber(num, den)
end

function -(x::RationalNumber, y::RationalNumber)
    num = x.numerator * y.denominator - y.numerator * x.denominator
    den = x.denominator * y.denominator
    return RationalNumber(num, den)
end

function *(x::RationalNumber, y::RationalNumber)
    num = x.numerator * y.numerator
    den = x.denominator * y.denominator
    return RationalNumber(num, den)
end

function /(x::RationalNumber, y::RationalNumber)
    num = x.numerator * y.denominator
    den = y.numerator * x.denominator
    return RationalNumber(num, den)
end

^(x::RationalNumber, n::Integer) = RationalNumber(x.numerator ^ abs(n), x.denominator ^ abs(n))
^(x::Real, n::RationalNumber) = x ^ float(n)

abs(x::RationalNumber) = RationalNumber(abs(x.numerator), abs(x.denominator))

-(x::RationalNumber) = RationalNumber(-x.numerator, x.denominator)

inv(x::RationalNumber) = RationalNumber(x.denominator, x.numerator)

# Comparisons

==(x::RationalNumber, y::RationalNumber) = (x.numerator == y.numerator) && (x.denominator == y.denominator)
==(x::RationalNumber, y::Real) = float(x) == y
<(x::RationalNumber, y::RationalNumber) = float(x) < float(y)
<(x::RationalNumber, y::Real) = float(x) < y
>(x::RationalNumber, y::RationalNumber) = float(x) > float(y)
>(x::RationalNumber, y::Real) = float(x) > y
<=(x::RationalNumber, y::RationalNumber) = !(x > y)
<=(x::RationalNumber, y::Real) = !(x > y)
>=(x::RationalNumber, y::RationalNumber) = !(x < y)
>=(x::RationalNumber, y::Real) = !(x < y)
