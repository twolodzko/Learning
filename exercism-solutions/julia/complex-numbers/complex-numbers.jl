import Base: +, -, *, /, abs, sqrt, ≈, conj, real, imag, exp, ==

struct ComplexNumber <: Number
    real::Real
    imag::Real
end

const jm = ComplexNumber(0, 1)

abs(x::ComplexNumber) = sqrt(x.real^2 + x.imag^2)

+(x::ComplexNumber, y::ComplexNumber) = ComplexNumber(x.real + y.real, x.imag + y.imag)

+(x::Real, y::ComplexNumber) = ComplexNumber(x + y.real, y.imag)

-(x::ComplexNumber, y::ComplexNumber) = ComplexNumber(x.real - y.real, x.imag - y.imag)

function *(x::ComplexNumber, y::ComplexNumber)
    real = x.real * y.real - x.imag * y.imag
    imag = x.imag * y.real + x.real * y.imag
    return ComplexNumber(real, imag)
end

*(x::Real, y::ComplexNumber) = ComplexNumber(x * y.real, x * y.imag)

function /(x::ComplexNumber, y::ComplexNumber)
    real = (x.real * y.real + x.imag * y.imag) / (y.real^2 + y.imag^2)
    imag = (x.imag * y.real - x.real * y.imag) / (y.real^2 + y.imag^2)
    return ComplexNumber(real, imag)
end

exp(x::ComplexNumber) = exp(x.real) * ComplexNumber(cos(x.imag), sin(x.imag))

==(x::ComplexNumber, y::ComplexNumber) = (x.real == y.real) && (x.imag == y.imag)

≈(x::ComplexNumber, y::ComplexNumber) = isapprox(x.real, y.real, atol=1e-6) && isapprox(x.imag, y.imag, atol=1e-6)

conj(x::ComplexNumber) = ComplexNumber(x.real, -x.imag)

real(x::ComplexNumber) = x.real

imag(x::ComplexNumber) = x.imag
