//����
function main(){
	var voteId = request.getLong("VOTE_ID");
	var openId = request.getString("OPEN_ID");

	//ͶƱ����
	var vo = db.find("select * from DEMO_VOTE where ID = ?",voteId);
	if(!vo){
	  nami.error("ͶƱ������");
	}

	//ѡ��
	var sql = "select a.*,ifnull(b.SIZE,0) SIZE from DEMO_VOTE_DETAIL a";
	sql += " left join (";
	sql += " 	select VOTE_ID,DETAIL_ID,count(1) SIZE from DEMO_VOTE_RESULT group by VOTE_ID,DETAIL_ID";
	sql += " ) b on b.DETAIL_ID = a.ID and b.VOTE_ID = a.VOTE_ID";
	sql += " where a.VOTE_ID = ? order by a.SORT asc";
	var items = db.query(sql,voteId);

	//�ҵ�ͶƱ���
	var my = db.find("select * from DEMO_VOTE_RESULT where VOTE_ID = ? and OPEN_ID = ? order by CREATE_TIME desc limit 1",voteId,openId);

	//��װ�������
	vo.items = items;
	
	var total = 0;
	items.forEach(function (item) {
		total += item.SIZE;
	});
	vo.totalSize = total;//��������
	
	vo.my = my;
	return vo;
}

//����
main();