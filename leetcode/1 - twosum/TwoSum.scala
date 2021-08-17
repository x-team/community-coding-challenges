package lectures.part4Implicits

object TwoSum extends App {

  def twoSum(nums: Array[Int], target: Int): Array[Int] = {

    def twoSum(inputMap: Map[Int, Int], index: Int): Array[Int] = {
      val valueCalculate = target - nums(index)
      if (inputMap.contains(valueCalculate)) Array(inputMap(valueCalculate), index)
      else twoSum(inputMap + (nums(index) -> index), index + 1)
    }

    twoSum(Map.empty[Int, Int], 0)

  }

  val anArray = Array(2, 7, 11, 15)
  print(twoSum(anArray, 9).toList)

}
