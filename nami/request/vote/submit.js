//����
function main(){
	var detailId = request.getLong("ITEM");
	var openId = request.getString("OPEN_ID");//TODO ����Ѷlogin apiû�зſ�֮ǰ��ʱ����request����open_id

	//�Ϸ���У��
	var detail = db.find("select * from DEMO_VOTE_DETAIL where ID = ?",detailId);
	if(!detail){
	  nami.error("ͶƱ������");
	}

	var result = db.find("select * from DEMO_VOTE_RESULT where VOTE_ID = ? and OPEN_ID = ? limit 1",detail.VOTE_ID,openId);
	if(result){
	  return {result:false};
	}

	//�Ǽ�ͶƱ��¼
	db.exec("insert into DEMO_VOTE_RESULT (VOTE_ID,DETAIL_ID,OPEN_ID) values (?,?,?)",detail.VOTE_ID,detailId,openId);
	return {result:true};
}

//����
main();
