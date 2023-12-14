const assert = require('assert')

const linearSearch = (list, target) => {
  //   when using foreach loop, by returning something inside the loop, it will not stop the loop and return the value

  //   list.forEach((item) => {
  //     console.log(item, ' - ', target)
  //     if (item === target) {
  //       console.log('entro...')
  //       return item
  //     }
  //   })

  //   when using for loop, by returning something inside the loop, it will stop the loop and return the value
  for (let j = 0; j < list.length; j++) {
    console.log(list[j], ' - ', target)
    if (list[j] === target) return j
  }
  return null
}

assert, assert.strictEqual(linearSearch([1, 2, 3, 4, 5], 3) === 2)
assert, strictEqual(linearSearch([1, 2, 3, 4, 5], 31) === null)

// console.log(linearSearch([1, 2, 3, 4, 5], 31)) // 2
