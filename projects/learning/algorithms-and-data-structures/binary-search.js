const assert = require('assert')

const binary = (arr, target) => {
  let first = 0
  let last = arr.length - 1
  while (first <= last) {
    let middle = Math.floor((first + last) / 2)
    if (arr[middle] === target) return middle
    else if (arr[middle] < target) first = middle + 1
    else last = middle - 1
  }

  return null
}

assert.strictEqual(binary([1, 2, 3, 4, 5], 5), 4)
assert.strictEqual(binary([1, 2, 3, 4, 5], 1), null)
