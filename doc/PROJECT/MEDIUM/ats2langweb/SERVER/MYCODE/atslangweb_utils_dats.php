<?php
/*
**
** The PHP code is generated by atscc2php
** The starting compilation time is: 2017-5-18: 23h:43m
**
*/

function
atslangweb_patsopt_tcats_code_0_($arg0)
{
//
  $tmpret3 = NULL;
//
  __patsflab_patsopt_tcats_code_0_:
  $tmpret3 = atslangweb__patsopt_tcats_code__4__1(1, $arg0);
  return $tmpret3;
} // end-of-function


function
atslangweb__patsopt_tcats_code__4__1($arg0, $arg1)
{
//
  $tmpret4__1 = NULL;
  $tmp5__1 = NULL;
  $tmp6__1 = NULL;
  $tmp7__1 = NULL;
//
  __patsflab_patsopt_tcats_code:
  $tmp5__1 = atslangweb__tmpfile_make_string("patsopt_tcats_", $arg1);
  $tmp6__1 = atslangweb__patsopt_tcats_file__6__1($arg0, $tmp5__1);
  $tmp7__1 = atslangweb__tmpfile_unlink($tmp5__1);
  $tmpret4__1 = $tmp6__1;
  return $tmpret4__1;
} // end-of-function


function
atslangweb__patsopt_tcats_file__6__1($arg0, $arg1)
{
//
  $tmpret12__1 = NULL;
  $tmp13__1 = NULL;
  $tmp14__1 = NULL;
  $tmp15__1 = NULL;
  $tmp16__1 = NULL;
  $tmp17__1 = NULL;
  $tmp18__1 = NULL;
  $tmp19__1 = NULL;
//
  __patsflab_patsopt_tcats_file:
  $tmp13__1 = atslangweb__tmpfile_make_nil("patsopt_tcats_");
  $tmp14__1 = atslangweb__patsopt_tcats_command__8__1($arg0, $arg1, $tmp13__1);
  $tmp15__1 = atslangweb_exec_retval($tmp14__1);
  $tmp17__1 = ats2phppre_eq_int0_int0($tmp15__1, 0);
  if($tmp17__1) {
    $tmp16__1 = array(0, "Typechecking passed!");
  } else {
    $tmp18__1 = atslangweb__tmpfile2string($tmp13__1);
    $tmp16__1 = array(1, $tmp18__1);
  } // endif
  $tmp19__1 = atslangweb__tmpfile_unlink($tmp13__1);
  $tmpret12__1 = $tmp16__1;
  return $tmpret12__1;
} // end-of-function


function
atslangweb__patsopt_tcats_command__8__1($arg0, $arg1, $arg2)
{
//
  $tmpret28__1 = NULL;
  $tmp29__1 = NULL;
  $tmp30__1 = NULL;
  $tmp31__1 = NULL;
//
  __patsflab_patsopt_tcats_command:
  $tmp29__1 = atslangweb__patsopt_command__0__1();
  $tmp31__1 = ats2phppre_eq_int0_int0($arg0, 0);
  if($tmp31__1) {
    $tmp30__1 = "--static";
  } else {
    $tmp30__1 = "--dynamic";
  } // endif
  $tmpret28__1 = sprintf("%s 2>%s --typecheck %s %s", $tmp29__1, $arg2, $tmp30__1, $arg1);
  return $tmpret28__1;
} // end-of-function


function
atslangweb__patsopt_command__0__1()
{
//
  $tmpret0__1 = NULL;
//
  __patsflab_patsopt_command:
  $tmpret0__1 = "patsopt";
  return $tmpret0__1;
} // end-of-function


function
atslangweb_patsopt_tcats_code_1_($arg0)
{
//
  $tmpret37 = NULL;
  $tmp38 = NULL;
//
  __patsflab_patsopt_tcats_code_1_:
  $tmp38 = sprintf("%s\n%s\n%s\n", $GLOBALS['atslangweb_patsopt_tcats_preamble'], $arg0, $GLOBALS['atslangweb_patsopt_tcats_postamble']);
  $tmpret37 = atslangweb_patsopt_tcats_code_0_($tmp38);
  return $tmpret37;
} // end-of-function


function
atslangweb_patsopt_ccats_code_0_($arg0)
{
//
  $tmpret39 = NULL;
//
  __patsflab_patsopt_ccats_code_0_:
  $tmpret39 = atslangweb__patsopt_ccats_code__13__1(1, $arg0);
  return $tmpret39;
} // end-of-function


function
atslangweb__patsopt_ccats_code__13__1($arg0, $arg1)
{
//
  $tmpret40__1 = NULL;
  $tmp41__1 = NULL;
  $tmp42__1 = NULL;
  $tmp43__1 = NULL;
//
  __patsflab_patsopt_ccats_code:
  $tmp41__1 = atslangweb__tmpfile_make_string("patsopt_ccats_", $arg1);
  $tmp42__1 = atslangweb__patsopt_ccats_file__15__1($arg0, $tmp41__1);
  $tmp43__1 = atslangweb__tmpfile_unlink($tmp41__1);
  $tmpret40__1 = $tmp42__1;
  return $tmpret40__1;
} // end-of-function


function
atslangweb__patsopt_ccats_file__15__1($arg0, $arg1)
{
//
  $tmpret48__1 = NULL;
  $tmp49__1 = NULL;
  $tmp50__1 = NULL;
  $tmp51__1 = NULL;
  $tmp52__1 = NULL;
  $tmp53__1 = NULL;
  $tmp54__1 = NULL;
  $tmp55__1 = NULL;
  $tmp56__1 = NULL;
  $tmp57__1 = NULL;
  $tmp58__1 = NULL;
  $tmp59__1 = NULL;
//
  __patsflab_patsopt_ccats_file:
  $tmp49__1 = atslangweb__tmpfile_make_nil("patsopt_ccats_");
  $tmp50__1 = atslangweb__tmpfile_make_nil("patsopt_ccats_");
  $tmp51__1 = atslangweb__patsopt_ccats_command__17__1($arg0, $arg1, $tmp49__1, $tmp50__1);
  $tmp52__1 = atslangweb_exec_retval($tmp51__1);
  $tmp54__1 = ats2phppre_eq_int0_int0($tmp52__1, 0);
  if($tmp54__1) {
    $tmp55__1 = atslangweb__patsopt_ccats_cont__20__1($tmp49__1);
    $tmp56__1 = atslangweb__tmpfile_unlink($tmp49__1);
    $tmp53__1 = $tmp55__1;
  } else {
    $tmp57__1 = atslangweb__tmpfile2string($tmp50__1);
    $tmp58__1 = atslangweb__tmpfile_unlink($tmp49__1);
    $tmp53__1 = array(1, $tmp57__1);
  } // endif
  $tmp59__1 = atslangweb__tmpfile_unlink($tmp50__1);
  $tmpret48__1 = $tmp53__1;
  return $tmpret48__1;
} // end-of-function


function
atslangweb__patsopt_ccats_command__17__1($arg0, $arg1, $arg2, $arg3)
{
//
  $tmpret72__1 = NULL;
  $tmp73__1 = NULL;
  $tmp74__1 = NULL;
  $tmp75__1 = NULL;
//
  __patsflab_patsopt_ccats_command:
  $tmp73__1 = atslangweb__patsopt_command__0__2();
  $tmp75__1 = ats2phppre_eq_int0_int0($arg0, 0);
  if($tmp75__1) {
    $tmp74__1 = "--static";
  } else {
    $tmp74__1 = "--dynamic";
  } // endif
  $tmpret72__1 = sprintf("%s 2>%s --output %s %s %s", $tmp73__1, $arg3, $arg2, $tmp74__1, $arg1);
  return $tmpret72__1;
} // end-of-function


function
atslangweb__patsopt_command__0__2()
{
//
  $tmpret0__2 = NULL;
//
  __patsflab_patsopt_command:
  $tmpret0__2 = "patsopt";
  return $tmpret0__2;
} // end-of-function


function
atslangweb__patsopt_ccats_cont__20__1($arg0)
{
//
  $tmpret81__1 = NULL;
  $tmp82__1 = NULL;
//
  __patsflab_patsopt_ccats_cont:
  $tmp82__1 = atslangweb__tmpfile2string($arg0);
  $tmpret81__1 = array(0, $tmp82__1);
  return $tmpret81__1;
} // end-of-function


function
atslangweb_patsopt_ccats_code_1_($arg0)
{
//
  $tmpret85 = NULL;
  $tmp86 = NULL;
//
  __patsflab_patsopt_ccats_code_1_:
  $tmp86 = sprintf("%s\n%s\n%s\n", $GLOBALS['atslangweb_patsopt_ccats_preamble'], $arg0, $GLOBALS['atslangweb_patsopt_ccats_postamble']);
  $tmpret85 = atslangweb_patsopt_ccats_code_0_($tmp86);
  return $tmpret85;
} // end-of-function


function
atslangweb_patsopt_atscc2js_code_0_($arg0)
{
//
  $tmpret87 = NULL;
//
  __patsflab_patsopt_atscc2js_code_0_:
  $tmpret87 = atslangweb__patsopt_ccats_code__13__2(1, $arg0);
  return $tmpret87;
} // end-of-function


function
atslangweb__patsopt_ccats_code__13__2($arg0, $arg1)
{
//
  $tmpret40__2 = NULL;
  $tmp41__2 = NULL;
  $tmp42__2 = NULL;
  $tmp43__2 = NULL;
//
  __patsflab_patsopt_ccats_code:
  $tmp41__2 = atslangweb__tmpfile_make_string("patsopt_ccats_", $arg1);
  $tmp42__2 = atslangweb__patsopt_ccats_file__15__2($arg0, $tmp41__2);
  $tmp43__2 = atslangweb__tmpfile_unlink($tmp41__2);
  $tmpret40__2 = $tmp42__2;
  return $tmpret40__2;
} // end-of-function


function
atslangweb__patsopt_ccats_file__15__2($arg0, $arg1)
{
//
  $tmpret48__2 = NULL;
  $tmp49__2 = NULL;
  $tmp50__2 = NULL;
  $tmp51__2 = NULL;
  $tmp52__2 = NULL;
  $tmp53__2 = NULL;
  $tmp54__2 = NULL;
  $tmp55__2 = NULL;
  $tmp56__2 = NULL;
  $tmp57__2 = NULL;
  $tmp58__2 = NULL;
  $tmp59__2 = NULL;
//
  __patsflab_patsopt_ccats_file:
  $tmp49__2 = atslangweb__tmpfile_make_nil("patsopt_ccats_");
  $tmp50__2 = atslangweb__tmpfile_make_nil("patsopt_ccats_");
  $tmp51__2 = atslangweb__patsopt_ccats_command__17__2($arg0, $arg1, $tmp49__2, $tmp50__2);
  $tmp52__2 = atslangweb_exec_retval($tmp51__2);
  $tmp54__2 = ats2phppre_eq_int0_int0($tmp52__2, 0);
  if($tmp54__2) {
    $tmp55__2 = atslangweb__patsopt_ccats_cont__24__1($tmp49__2);
    $tmp56__2 = atslangweb__tmpfile_unlink($tmp49__2);
    $tmp53__2 = $tmp55__2;
  } else {
    $tmp57__2 = atslangweb__tmpfile2string($tmp50__2);
    $tmp58__2 = atslangweb__tmpfile_unlink($tmp49__2);
    $tmp53__2 = array(1, $tmp57__2);
  } // endif
  $tmp59__2 = atslangweb__tmpfile_unlink($tmp50__2);
  $tmpret48__2 = $tmp53__2;
  return $tmpret48__2;
} // end-of-function


function
atslangweb__patsopt_ccats_command__17__2($arg0, $arg1, $arg2, $arg3)
{
//
  $tmpret72__2 = NULL;
  $tmp73__2 = NULL;
  $tmp74__2 = NULL;
  $tmp75__2 = NULL;
//
  __patsflab_patsopt_ccats_command:
  $tmp73__2 = atslangweb__patsopt_command__0__3();
  $tmp75__2 = ats2phppre_eq_int0_int0($arg0, 0);
  if($tmp75__2) {
    $tmp74__2 = "--static";
  } else {
    $tmp74__2 = "--dynamic";
  } // endif
  $tmpret72__2 = sprintf("%s 2>%s --output %s %s %s", $tmp73__2, $arg3, $arg2, $tmp74__2, $arg1);
  return $tmpret72__2;
} // end-of-function


function
atslangweb__patsopt_command__0__3()
{
//
  $tmpret0__3 = NULL;
//
  __patsflab_patsopt_command:
  $tmpret0__3 = "patsopt";
  return $tmpret0__3;
} // end-of-function


function
atslangweb__patsopt_ccats_cont__24__1($arg0)
{
//
  $tmpret88__1 = NULL;
//
  __patsflab_patsopt_ccats_cont:
  $tmpret88__1 = atslangweb__atscc2js_comp_file__30__1($arg0);
  return $tmpret88__1;
} // end-of-function


function
atslangweb__atscc2js_comp_file__30__1($arg0)
{
//
  $tmpret111__1 = NULL;
  $tmp112__1 = NULL;
  $tmp113__1 = NULL;
  $tmp114__1 = NULL;
  $tmp115__1 = NULL;
  $tmp116__1 = NULL;
  $tmp117__1 = NULL;
  $tmp118__1 = NULL;
  $tmp119__1 = NULL;
  $tmp120__1 = NULL;
  $tmp121__1 = NULL;
  $tmp122__1 = NULL;
//
  __patsflab_atscc2js_comp_file:
  $tmp112__1 = atslangweb__tmpfile_make_nil("atscc2js_comp_");
  $tmp113__1 = atslangweb__tmpfile_make_nil("atscc2js_comp_");
  $tmp114__1 = atslangweb__atscc2js_comp_command__32__1($arg0, $tmp112__1, $tmp113__1);
  $tmp115__1 = atslangweb_exec_retval($tmp114__1);
  $tmp117__1 = ats2phppre_eq_int0_int0($tmp115__1, 0);
  if($tmp117__1) {
    $tmp118__1 = atslangweb__tmpfile2string($tmp112__1);
    $tmp119__1 = atslangweb__tmpfile_unlink($tmp112__1);
    $tmp116__1 = array(0, $tmp118__1);
  } else {
    $tmp120__1 = atslangweb__tmpfile2string($tmp113__1);
    $tmp121__1 = atslangweb__tmpfile_unlink($tmp112__1);
    $tmp116__1 = array(1, $tmp120__1);
  } // endif
  $tmp122__1 = atslangweb__tmpfile_unlink($tmp113__1);
  $tmpret111__1 = $tmp116__1;
  return $tmpret111__1;
} // end-of-function


function
atslangweb__atscc2js_comp_command__32__1($arg0, $arg1, $arg2)
{
//
  $tmpret135__1 = NULL;
  $tmp136__1 = NULL;
//
  __patsflab_atscc2js_comp_command:
  $tmp136__1 = atslangweb__atscc2js_command__1__1();
  $tmpret135__1 = sprintf("%s 2>%s --output %s --input %s", $tmp136__1, $arg2, $arg1, $arg0);
  return $tmpret135__1;
} // end-of-function


function
atslangweb__atscc2js_command__1__1()
{
//
  $tmpret1__1 = NULL;
//
  __patsflab_atscc2js_command:
  $tmpret1__1 = "atscc2js";
  return $tmpret1__1;
} // end-of-function


function
atslangweb_patsopt_atscc2js_code_1_($arg0)
{
//
  $tmpret140 = NULL;
  $tmp141 = NULL;
//
  __patsflab_patsopt_atscc2js_code_1_:
  $tmp141 = sprintf("%s\n%s\n%s\n", $GLOBALS['atslangweb_patsopt_atscc2js_preamble'], $arg0, $GLOBALS['atslangweb_patsopt_atscc2js_postamble']);
  $tmpret140 = atslangweb_patsopt_atscc2js_code_0_($tmp141);
  return $tmpret140;
} // end-of-function


function
atslangweb_pats2xhtml_eval_code_0_($arg0, $arg1)
{
//
  $tmpret142 = NULL;
//
  __patsflab_pats2xhtml_eval_code_0_:
  $tmpret142 = atslangweb__pats2xhtml_eval_code__37__1($arg0, $arg1);
  return $tmpret142;
} // end-of-function


function
atslangweb__pats2xhtml_eval_code__37__1($arg0, $arg1)
{
//
  $tmpret143__1 = NULL;
  $tmp144__1 = NULL;
  $tmp145__1 = NULL;
  $tmp146__1 = NULL;
//
  __patsflab_pats2xhtml_eval_code:
  $tmp144__1 = atslangweb__tmpfile_make_string("pats2xhtml_", $arg1);
  $tmp145__1 = atslangweb__pats2xhtml_eval_file__39__1($arg0, $tmp144__1);
  $tmp146__1 = atslangweb__tmpfile_unlink($tmp144__1);
  $tmpret143__1 = $tmp145__1;
  return $tmpret143__1;
} // end-of-function


function
atslangweb__pats2xhtml_eval_file__39__1($arg0, $arg1)
{
//
  $tmpret151__1 = NULL;
  $tmp152__1 = NULL;
  $tmp153__1 = NULL;
  $tmp154__1 = NULL;
  $tmp155__1 = NULL;
  $tmp156__1 = NULL;
  $tmp157__1 = NULL;
  $tmp158__1 = NULL;
  $tmp159__1 = NULL;
  $tmp160__1 = NULL;
  $tmp161__1 = NULL;
  $tmp162__1 = NULL;
//
  __patsflab_pats2xhtml_eval_file:
  $tmp152__1 = atslangweb__tmpfile_make_nil("pats2xhtml_");
  $tmp153__1 = atslangweb__tmpfile_make_nil("pats2xhtml_");
  $tmp154__1 = atslangweb__pats2xhtml_eval_command__41__1($arg0, $arg1, $tmp152__1, $tmp153__1);
  $tmp155__1 = atslangweb_exec_retval($tmp154__1);
  $tmp157__1 = ats2phppre_eq_int0_int0($tmp155__1, 0);
  if($tmp157__1) {
    $tmp158__1 = atslangweb__tmpfile2string($tmp152__1);
    $tmp159__1 = atslangweb__tmpfile_unlink($tmp152__1);
    $tmp156__1 = array(0, $tmp158__1);
  } else {
    $tmp160__1 = atslangweb__tmpfile2string($tmp153__1);
    $tmp161__1 = atslangweb__tmpfile_unlink($tmp152__1);
    $tmp156__1 = array(1, $tmp160__1);
  } // endif
  $tmp162__1 = atslangweb__tmpfile_unlink($tmp153__1);
  $tmpret151__1 = $tmp156__1;
  return $tmpret151__1;
} // end-of-function


function
atslangweb__pats2xhtml_eval_command__41__1($arg0, $arg1, $arg2, $arg3)
{
//
  $tmpret175__1 = NULL;
  $tmp176__1 = NULL;
  $tmp177__1 = NULL;
  $tmp178__1 = NULL;
//
  __patsflab_pats2xhtml_eval_command:
  $tmp176__1 = atslangweb__pats2xhtml_command__2__1();
  $tmp178__1 = ats2phppre_eq_int0_int0($arg0, 0);
  if($tmp178__1) {
    $tmp177__1 = "--static";
  } else {
    $tmp177__1 = "--dynamic";
  } // endif
  $tmpret175__1 = sprintf("%s 2>%s --embedded --output %s %s %s", $tmp176__1, $arg3, $arg2, $tmp177__1, $arg1);
  return $tmpret175__1;
} // end-of-function


function
atslangweb__pats2xhtml_command__2__1()
{
//
  $tmpret2__1 = NULL;
//
  __patsflab_pats2xhtml_command:
  $tmpret2__1 = "pats2xhtml";
  return $tmpret2__1;
} // end-of-function

/* ****** ****** */

/* end-of-compilation-unit */
?>
