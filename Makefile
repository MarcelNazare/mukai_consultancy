runserver:
	@echo "[+] Run server on port 4421"
	@pnpm run dev
	
killport :
	@fuser -k 4421/tcp


install:
	@echo "[+] Install dependencies"
	@pnpm install
