
## genesis.json

## dockerfile
```docker
FROM ethereum/client-go:v1.13.14

WORKDIR /root

COPY genesis.json genesis.json

COPY script.sh /run.sh

RUN geth init ./genesis.json

RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
```
- `ethereum/client-go:latest` 는 `stable version`이 아니기에, 검증이 안된 버전의 이미지를 다운받을수도 있다. 때문에 버전 선정은 [**go-ethereum guthub release 노트**](https://github.com/ethereum/go-ethereum/releases)의 stable version을 확인해야 한다.
- geth는 default path로 `/root/.etheruem`를 사용한다. 때문에, `genesis.json`, `passward.txt`같은 geth 설정 파일은 `/root`에서 관리하게 된다.
    - 다른 폴더에서 관리하고싶으면 별도fh geth 경로를 설정하면 된다.
- `.sh`은 실행 권한을 위해 **절대 경로**를 사용하기에 `/root`에서 실행하는 경우, 절대경로 `/run.sh` 설정이 필요하다.
- `ethereum/client-go` 이미지는 기본적으로 `ENTRPOINT ["geth"]`가 설정되어 있다. 이번 자료에서는 `run.sh`을 통해 노드를 실행할 예정이니, `ENTRYPOINT ["/run.sh"]`로 오버라이딩 해준다.