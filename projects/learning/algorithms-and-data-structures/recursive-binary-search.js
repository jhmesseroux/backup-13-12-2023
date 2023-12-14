const assert = require('assert')

const recursiveBinary = (arr, target) => {
  if (arr.length === 0) return false
  else {
    let middle = Math.floor(arr.length / 2)

    if (arr[middle] === target) return true
    else {
      // !TODO THE RETURN IS IMPORTANT HERE. THATS means that the function will return the value of the recursive function
      if (arr[middle] < target) return recursiveBinary(arr.slice(middle + 1), target)
      else return recursiveBinary(arr.slice(0, middle), target)
    }
  }
}

assert.strictEqual(recursiveBinary([1, 2, 3, 4, 5], 5), true)
assert.strictEqual(recursiveBinary([1, 2, 3, 4, 5], 1), true)
assert.strictEqual(recursiveBinary([1, 2, 3, 4, 5], 6), false)

// THE BINARY VERSION ID BWTTER USUING PYTHON BECAUSE IT DESO IMPLEMEENT TAIL IMPLEMENTATION
