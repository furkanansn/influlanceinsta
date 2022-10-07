class GeneralModel{

  bool _success;
  var _data;
  String _errorMessage;


  GeneralModel();
  GeneralModel.name(this._success, this._data, this._errorMessage);

  String get errorMessage => _errorMessage;

  set errorMessage(String value) {
    _errorMessage = value;
  }

  get data => _data;

  set data(value) {
    _data = value;
  }

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }
}