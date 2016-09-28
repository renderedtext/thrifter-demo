
struct Complex {
  1: i16 r
  2: i16 i
}

struct Status {
  1: bool success
  2: string desc
}

struct Result {
  1: Status status
  2: Complex result
}

service Test {
  Result add(1: Complex a, 2: Complex b)
  Result sub(1: Complex a, 2: Complex b)
}
