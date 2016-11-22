use WWW::Mechanize::Firefox;
my $adminPanel  = 'https://example.com/admin/';
my $mech = WWW::Mechanize::Firefox->new( autoclose => 0);

while(1){
  $mech->get($adminPanel.'stock/list/page/1?limit=200');
  while($mech->content !~ /main-table-checkbox-0/){}
  $mech->click({ xpath => '//input[@id="main-table-checkbox-0"]' , synchronize => 0});
  while($mech->content !~ /data-confirm-submit="1"/){}
  $mech->click({ xpath => '//button[@data-confirm-submit="1"]' , synchronize => 0});
}
