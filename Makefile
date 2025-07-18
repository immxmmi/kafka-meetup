#Setup
check_requirements:
	@command -v docker >/dev/null 2>&1 || { echo >&2 "❌ Docker is not installed. Please install Docker before proceeding."; exit 1; }
	@command -v minikube >/dev/null 2>&1 || { echo >&2 "❌ Minikube is not installed. Please install Minikube before proceeding."; exit 1; }
	@command -v helm >/dev/null 2>&1 || { echo >&2 "❌ Helm is not installed. Please install Helm before proceeding."; exit 1; }
	@echo "✅ All requirements are met. You are ready to proceed!"

setup_environment: check_requirements
	make -C tools/minikube minikube_start
	make -C tools/argo argocd_install
	make -C tools/argo argocd_port_forward_ui
