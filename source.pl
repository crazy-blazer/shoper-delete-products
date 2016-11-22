use WWW::Mechanize::Firefox;
my $adminPanel  = 'https://example.com/admin/'; # Admin Panel URL

my $mech = WWW::Mechanize::Firefox->new( autoclose => 0);
my $limit = 200; # This value change on own risk!

while(1){
  if($adminPanel !~ /\/$/){
    $adminPanel .= '/';
  }
  my $productList = $adminPanel.'stock/list/page/1?limit='.$limit;
  $mech->get($productList);
  while($mech->content !~ /main-table-checkbox-0/){#sleep(1);}
  $mech->click({ xpath => '//input[@id="main-table-checkbox-0"]' , synchronize => 0});
  while($mech->content !~ /data-confirm-submit="1"/){#sleep(1);}
  $mech->click({ xpath => '//button[@data-confirm-submit="1"]' , synchronize => 0});
}
