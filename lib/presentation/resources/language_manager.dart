enum LanguageType { ENGLISH, INDONESIA }

const String INDONESIA = "id";
const String ENGLISH = "en";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.INDONESIA:
        return INDONESIA;
    }
  }
}
