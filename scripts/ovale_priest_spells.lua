local OVALE, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "ovale_priest_spells"
	local desc = "[7.0] Ovale: Priest spells"
	local code = [[
# Priest spells and functions.

# Dummy spells
Define(mindbender_tier18_2pc 999123040)
	SpellInfo(mindbender_tier18_2pc dummy_replace=123040 replace=mindbender)
	SpellInfo(mindbender_tier18_2pc cd=20)
Define(shadowfiend_tier18_2pc 999034433)
	SpellInfo(shadowfiend_tier18_2pc dummy_replace=34433 replace=shadowfiend)
	SpellInfo(shadowfiend_tier18_2pc cd=20)

Define(auspicious_spirits_talent 21)
Define(body_and_soul_talent 4)
Define(dispersion 47585)
	SpellInfo(dispersion cd=120)
Define(fortress_of_the_mind_talent 2)
Define(from_the_shadows 193642)
Define(insanity_drain_stacks_buff 194249)
Define(legacy_of_the_void_talent 19)
Define(mass_hysteria 194378)
Define(mental_fatigue_debuff 185104)
	SpellInfo(mental_fatigue_debuff duration=10 max_stacks=5)
Define(mental_instinct_buff 167254)
	SpellInfo(mental_instinct_buff duration=4 max_stacks=12)
Define(mind_blast 8092)
	SpellInfo(mind_blast cd=9 cd_haste=spell)
	SpellRequire(mind_blast cd 6=buff,voidform_buff)
	SpellAddBuff(mind_blast shadowy_insight_buff=0 if_spell=shadowy_insight)
Define(mind_flay 15407)
	SpellInfo(mind_flay channel=3 haste=spell)
	SpellInfo(mind_flay channel=2 if_spell=enhanced_mind_flay)
Define(mindbender 123040)
	SpellInfo(mindbender cd=60 tag=main)
	SpellInfo(mindbender addcd=-40 itemset=T18 itemcount=2 specialization=shadow)
Define(mindbender_talent 18)
Define(misery_talent 17)
Define(power_infusion 10060)
	SpellInfo(power_infusion cd=120 gcd=0)
	SpellAddBuff(power_infusion power_infusion_buff=1)
Define(power_infusion_buff 10060)
	SpellInfo(power_infusion_buff duration=20)
Define(power_infusion_talent 14)
Define(power_word_shield 17)
	SpellInfo(power_word_shield cd=6)
	SpellRequire(power_word_shield unusable 1=target_debuff,weakened_soul_debuff)
	SpellAddDebuff(power_word_shield weakened_soul_debuff=1)
Define(psychic_scream 8122)
	SpellInfo(psychic_scream cd=30)
Define(psychic_scream_talent 11)
Define(reaper_of_souls_talent 11)
Define(sanlayn_talent 13)
Define(shadow_crash 205385)
	SpellInfo(shadow_crash cd=30 insanity=-15 tag=main)
Define(shadow_crash_talent 17)
Define(shadow_word_void 205351)
	SpellInfo(shadow_word_void cd=30 charges=3 insanity=-25 tag=main)
Define(shadow_word_death 32379)
	SpellInfo(shadow_word_death cd=9 target_health_pct=20)
Define(shadow_word_death_reset_cooldown_buff 125927)	# OvaleShadowWordDeath
	SpellInfo(shadow_word_death_reset_cooldown_buff duration=9)
Define(shadow_word_pain 589)
	SpellAddTargetDebuff(shadow_word_pain shadow_word_pain_debuff=1)
Define(shadow_word_pain_debuff 589)
	SpellInfo(shadow_word_pain_debuff duration=18 haste=spell tick=3)
Define(shadow_word_void_talent 3)
Define(shadowfiend 34433)
	SpellInfo(shadowfiend cd=180 tag=main)
	SpellInfo(shadowfiend addcd=-160 itemset=T18 itemcount=2 specialization=shadow)
	SpellInfo(shadowfiend replace=mindbender if_spell=mindbender)
Define(shadowform 232698)
Define(shadowform_buff 232698)
Define(shadowy_insight 162452)
Define(shadowy_insight_buff 124430)
	SpellInfo(shadowy_insight_buff duration=12)
Define(shadowy_insight_talent 15)
Define(silence 15487)
	SpellInfo(silence cd=45 gcd=0 interrupt=1)
Define(sphere_of_insanity 194179)
Define(surrender_to_madness 193223)
	SpellInfo(surrender_to_madness cd=600)
	SpellAddBuff(surrender_to_madness surrender_to_madness_buff=1)
Define(surrender_to_madness_buff 193223)
	SpellInfo(surrender_to_madness_buff duration=180)
Define(surrender_to_madness_talent 21)
Define(t18_class_trinket 124519)
Define(unleash_the_shadows 194093)
Define(vampiric_touch 34914)
	SpellAddTargetDebuff(vampiric_touch vampiric_touch_debuff=1)
	SpellAddTargetDebuff(vampiric_touch shadow_word_pain_debuff=1 talent=misery_talent)
Define(vampiric_touch_debuff 34914)
	SpellInfo(vampiric_touch_debuff duration=15 haste=spell tick=3)
Define(void_bolt 205448)
	SpellInfo(void_bolt cd=4.5 insanity=-16)
	SpellRequire(void_bolt unusable 1=buff,!voidform_buff)
	SpellAddTargetDebuff(void_bolt shadow_word_pain_debuff=refresh)
	SpellAddTargetDebuff(void_bolt vampiric_touch_debuff=refresh)
Define(void_eruption 228260)
	SpellInfo(void_eruption cd=180 insanity=100)
	SpellAddBuff(void_eruption voidform_buff=1)
	SpellRequire(void_eruption unusable 1=buff,voidform_buff)
	SpellRequire(void_eruption replace void_bolt=buff,voidform_buff)
Define(void_torrent 205065)
	SpellInfo(void_torrent cd=60 tag=main)
	SpellRequire(void_torrent unusable 0=buff,voidform_buff)
Define(void_torrent_buff 205065) # TODO Insanity does not drain during this buff
Define(voidform_buff 194249)
Define(weakened_soul_debuff 6788)
	SpellInfo(weakened_soul_debuff duration=15)

AddFunction CurrentInsanityDrain {
	if BuffPresent(void_torrent_buff) 0
	if BuffPresent(voidform_buff) BuffStacks(voidform_buff)/2 + 9
	0
}
]]

	OvaleScripts:RegisterScript("PRIEST", nil, name, desc, code, "include")
end
