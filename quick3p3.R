# 3+3 in 6 minutes
# can easily turn into function for multiple simulations, or consider results at each step
# now we have a baseline for comparison with other designs!
nCohorts = 10
aCohorts = 1
rRolls = function(a) {
  return(rbinom(1, 3, a))
}
doseLevel = 1
ndoseLevel = 5
tox = c(0.1, 0.2, 0.3, 0.4, 0.5)
error = -1
MTD = -1
x = 0
while (error == -1) {
  rC = rRolls(tox[doseLevel])
  if (rC > x) {
    if (doseLevel == 1) {
      error = 3
    } else{
      MTD = doseLevel - 1
      error = 0
    }
  } else{
    if (aCohorts == nCohorts) {
      error = 1
    } else if (rC == 0) {
      if (doseLevel == ndoseLevel) {
        error = 2
      }
      aCohorts = aCohorts + 1
      doseLevel = doseLevel + 1
      x = 1
    } else{
      aCohorts = aCohorts + 1
      x = 0
    }
  }
}
print(c(MTD, error)) # if MTD = -1, consider error message (1: out of patients, 2: reached max dose, 3: first dose too toxic)
