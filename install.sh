echo -e "\033[33;34m[*] Checking system for compability"
DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

if ! command -v docker &> /dev/null
then
	echo -e "\033[33;31m[-] Docker could not be found"
	exit
fi

if ! command -v docker-compose &> /dev/null
then
	echo -e "\033[33;31m[-] Docker-compose not found"
	exit
fi

FILE1="${DIR}/.env"
FILE2="${DIR}/install.sh"
FILE3="${DIR}/reconwithme"
FILE4="${DIR}/docker-compose.yml"


if ! [ -f "$FILE1" ]; then
	echo -e "[-] ${FILE1} do not exist."
	exit 2
fi

if ! [ -f "$FILE2" ]; then
	echo -e "[-] ${FILE2} do not exist."
	exit 2
fi

if ! [ -f "$FILE3" ]; then
	echo -e "\033[33;31m[-] ${FILE3} do not exist."
	exit 2
fi

if ! [ -f "$FILE4" ]; then
	echo -e "[-] ${FILE4} do not exist."
	exit 2
fi

echo -e "\033[33;32m[*] Installing/Updating Reconwithme"

docker-compose up -d

echo -e "\033[33;32m[*] Reconwithme up and running"
echo -e "[*] Wrapping up..."
