import UIKit
struct CalculatorBrain{
    
    var bmi : BMI?
    
    func getBMIValue()->String{
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiValue
    }
    
    func getBMIColor() -> UIColor{
        return bmi?.color ?? UIColor.blue
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? "No advice yet!"
    }
    
    mutating func calculateBMI(w: Int, h: Double){
        let bmiValue = roundDob(N: Double(w)/pow(h,2),I: 1)
        if(bmiValue<18.5){
            bmi =  BMI(color: UIColor.green, value: bmiValue, advice: "You are underweight! \("\n")Eat more carbohydrates!")
        }else if(bmiValue>18.5 && bmiValue<24.9){
            bmi = BMI(color: UIColor.yellow, value: bmiValue, advice: "Your weight is optimal. \("\n")Go on with your eating habits!")
        }else{
            bmi = BMI(color: UIColor.red, value: bmiValue, advice:  "You are overweight! \("\n")It is better to cut off some snacks!")
        }
    }
    
    func roundDob (N: Double, I:Double)->Double{
        return round(N * pow(10.0, I)) / pow(10.0, I)
        
    }
}
