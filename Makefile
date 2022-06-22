.PHONY: help format clean upgrade run_unit lint build_apk_development build_apk_staging build_apk_production

help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
        help_split=($$help_line) ; \
        help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
        help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
        printf "%-30s %s\n" $$help_command $$help_info ; \
    done

format: ## Formatting the code
	@echo "╠ Formatting the code"
	@dart format .
clean: ## Cleaning the project
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean
	@echo "╠ finish..."

upgrade: clean ## Upgrading dependencies
	@echo "╠ Upgrading dependencies..."
	@flutter pub upgrade

run_unit: ## Running the tests
	@echo "╠ Running the tests"
	@flutter test || (echo "▓▓ Error while running tests ▓▓"; exit 1)

lint: ## Verifying code | Code linting
	@echo "╠ Verifying code..."
	@dart analyze . || (echo "▓▓ Lint error ▓▓"; exit 1)

apk_development_android: clean run_unit ## Build apk file for development android
	@echo "╠ Build apk file for development"
	@flutter build apk --release -t lib/flavor/development/main.dart --flavor development

apk_staging_android: clean run_unit ## Build apk file for staging android
	@echo "╠ Build apk file for staging"
	@flutter build apk --release -t lib/flavor/staging/main.dart --flavor staging

apk_production_android: clean run_unit ## Build apk file for production android
	@echo "╠ Build apk file for production"
	@flutter build apk --release -t lib/flavor/production/main.dart --flavor production

abb_development_android: clean run_unit ## Build apk file for development android
	@echo "╠ Build app bundle file for development"
	@flutter build appbundle --release -t lib/flavor/development/main.dart --flavor development

abb_staging_android: clean run_unit ## Build apk file for staging android
	@echo "╠ Build app bundle file for staging"
	@flutter build appbundle --release -t lib/flavor/staging/main.dart --flavor staging

abb_production_android: clean run_unit ## Build apk file for production android
	@echo "╠ Build app bundle file for production"
	@flutter build appbundle --release -t lib/flavor/production/main.dart --flavor production

