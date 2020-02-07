unit UnitData;

{*------------------------------------------------------------------------------
  @author  ��Ҷ��
  @version 2020/01/29 1.0 Initial revision.
  @comment �洢ͼ�����ݵĽṹ

  ÿһ��ͼ����4���������

    ����(����Ӧ����4)   ������Լ��������飬Ҳ����ʹ��ϵͳ(Delphi)�Դ���

    array 0...3 of TPoint       TArray<T>           array  of T

    ʹ��TList<T>

  ÿһ��ͼ����4���������
        ����ʹ��TPoint����ʾ���꣬����ṹ�屾�����������ֶ���X,Y

        4��������Ҫ�洢��һ��������TList<T>

  TList<TList<TPoint>>
-------------------------------------------------------------------------------}
interface

uses
  System.Types, System.Generics.Collections;

type
  TGameData = class
  public

    //�ú�����Ϊ���ຯ�������Բ���Ҫͨ�����������е���
    class function GetActByIndex(ActIndex: Integer): TList<TPoint>;
  end;

implementation

var
  ActList: TList<TList<TPoint>>;  //ͼ���б�

  Points: Tlist<Tpoint>;   //����ÿһ��ͼ�ε�����

{ TGameData }

{*------------------------------------------------------------------------------
  ���ݱ��(����)���ض�Ӧ��ͼ������

  @param ActIndex  ͼ�α�ţ�ȡֵ��Χ0---6
  @return  ָ����ͼ������
-------------------------------------------------------------------------------}

class function TGameData.GetActByIndex(ActIndex: Integer): TList<TPoint>;
begin

  Result := ActList.Items[ActIndex];
end;

initialization
  //�����б�����
  ActList := TList<TList<TPoint>>.Create;
  //����ͼ������
  Points := TList<TPoint>.Create();
  //һ����
  Points.Add(TPoint.create(6, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(8, 0));
  Points.Add(TPoint.Create(9, 0));
  //����ͼ�ε����ݴ����б�
  ActList.Add(Points);
  Points := TList<TPoint>.Create();
  //T����
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(8, 0));
  Points.Add(TPoint.Create(7, 1));
  ActList.Add(Points);
  //L����
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(5, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(5, 1));
  ActList.Add(Points);
  //Z����
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(5, 1));
  Points.Add(TPoint.Create(6, 1));
  ActList.Add(Points);
  //��Z����
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(5, 0));
  Points.Add(TPoint.Create(6, 1));
  Points.Add(TPoint.Create(7, 1));
  ActList.Add(Points);
  // �� ����
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(5, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(7, 1));
  ActList.Add(Points);
  //������
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(6, 1));
  Points.Add(TPoint.Create(7, 1));
  ActList.Add(Points);

end.
