unit UnitDriverMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShareMem;

type
  TForm1 = class(TForm)
    btnCall: TButton;
    Button1: TButton;
    procedure btnCallClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
procedure ShowDllMainForm(p: string); stdcall;
  external 'DelphiDll.dll';
procedure ChangeName(out pOut: pWideChar); stdcall;
  external 'DelphiDll.dll';

implementation

{$R *.dfm}

procedure TForm1.btnCallClick(Sender: TObject);
begin
  ShowDllMainForm('DLL ����');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  p:PWideChar;
begin
  //p := 'en';
  ChangeName(p);
  ShowMessage(p);
end;

{ C# ����ʵ��

  [DllImport(@"DelphiDll.dll", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
  public extern static void ShowDllMainForm(string p);

  [DllImport(@"DelphiDll.dll", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
  public extern static IntPtr GetName();
  private void button1_Click(object sender, EventArgs e)

      // C# ����Delphi���̣���ʾһ������
      ShowDllMainForm("�й�");
      // C# ���ú���������һ���ַ���ָ�루PChar, PAnsiChar, PWideChar��
      var p = GetName();
      string s = Marshal.PtrToStringUni((IntPtr)p);
      MessageBox.Show(s);

}

end.
