class Recipe {

  int _cows;
  int _trampolines;
  int result;


  Recipe(this._cows, this._trampolines);

  int makemilkshake(){
    result = this._cows + this._trampolines;
    print("result is   " +result.toString());
    return result;
  }

  int get makeShake => result;

}