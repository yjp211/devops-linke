//����
function main(){
	var curid = request.getLong("CUR_ID");
	
	//�����ȡͶƱ����
	var sql = "select * from DEMO_VOTE";
	if(curid){//��һ������,�ų���ǰid
		sql += " where ID != "+curid;
	}
	var list = db.query(sql);
	var index = Math.floor((Math.random()*list.size())); 
	var vo = list.get(index);

	//��ȡѡ��
	var items = db.query("select * from DEMO_VOTE_DETAIL where VOTE_ID = ? order by SORT asc",vo.ID);

	//��װ���󷵻�ǰ��
	vo.items = items;
	return vo;
}

//����
main();